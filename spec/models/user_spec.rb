require 'rails_helper'

RSpec.describe User, type: :model do
  context '#create' do
    it 'is valid with existing name' do
      user = User.new(name: 'Tom', posts_counter: 0)
      expect(user).to be_valid
    end

    it 'is not valid with blank name' do
      user = User.new(name: '')
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is not valid with non-numeric posts_counter' do
      user = User.new(name: 'Tom', posts_counter: 'five')
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('is not a number')
    end

    it 'is not valid with negative posts_counter' do
      user = User.new(name: 'Tom', posts_counter: -1)
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end

    it 'is valid with zero posts_counter' do
      expect(User.create(name: 'Tom', posts_counter: 0)).to be_valid
    end

    it 'is valid with positive posts_counter' do
      expect(User.create(name: 'Tom', posts_counter: 5)).to be_valid
    end
  end

  context '#recent_posts' do
    before :each do
      @user = User.create(name: 'Tom')
      5.times { |i| @user.posts.build(title: "Post #{i + 1}") }
      @user.save
    end

    it 'returns the most recent posts' do
      recent_posts = @user.recent_posts
      expected_count = 0
      expect(recent_posts.count).to eq(expected_count)
      expect(recent_posts).to eq(@user.posts.last(expected_count).reverse)
    end
  end
end
