class PostsController < ApplicationController
  def index
    # Retrieve all posts by the user with the specified user_id from the database
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    # Retrieve the post with the specified id from the database
    @post = Post.find(params[:id])
  end
end
