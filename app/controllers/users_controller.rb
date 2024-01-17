class UsersController < ApplicationController
  def index
    # Retrieve all users from the database
    @users = User.all
  end

  def show
    # Retrieve the user with the specified id from the database
    @user = User.find(params[:id])
  end
end
