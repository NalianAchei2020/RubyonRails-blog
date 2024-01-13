require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user = User.create(name: 'Nerbard')
    @post = Post.create(author: @user, title: 'Title')
  end

  context '#create' do
    it 'is valid with existing user and post' do
      expect(Like.new(user: @user, post: @post)).to be_valid
    end

    it 'is not valid without post' do
      expect(Like.new(user: @user)).to_not be_valid
    end

    it 'is not valid without user' do
      expect(Like.new(post: @post)).to_not be_valid
    end
  end

  context '#update_likes_counter' do
    before :all do
      8.times { Like.create(user: @user, post: @post, post_id: 1) }
    end
  end
end
