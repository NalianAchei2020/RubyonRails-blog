require 'rails_helper'
RSpec.describe Post, type: :model do
  it "is valid with a title, comments_counter, and likes_counter" do
    user = User.create(name: "John Doe") # Create a valid User instance
    post = Post.new(title: "Sample Post", comments_counter: 2, likes_counter: 5, author: user) # Associate the User instance with the Post
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = Post.new(title: "", comments_counter: 2, likes_counter: 5)
    expect(post).to_not be_valid
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid with a title exceeding 250 characters" do
    long_title = "a" * 251
    post = Post.new(title: long_title, comments_counter: 2, likes_counter: 5)
    expect(post).to_not be_valid
    expect(post.errors[:title]).to include("is too long (maximum is 250 characters)")
  end

  it "is invalid with a negative comments_counter" do
    post = Post.new(title: "Sample Post", comments_counter: -1, likes_counter: 5)
    expect(post).to_not be_valid
    expect(post.errors[:comments_counter]).to include("must be greater than or equal to 0")
  end

  it "is invalid with a negative likes_counter" do
    post = Post.new(title: "Sample Post", comments_counter: 2, likes_counter: -1)
    expect(post).to_not be_valid
    expect(post.errors[:likes_counter]).to include("must be greater than or equal to 0")
  end
end
