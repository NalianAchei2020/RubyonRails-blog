require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      # Perform the request
      get :index

      # Expect the response status to be 200 (OK)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      # Perform the request
      get :index

      # Expect the correct template to be rendered
      expect(response).to render_template(:index)
    end

    it 'assigns all users to @users' do
      # Create some sample users
      user1 = User.create(name: 'Nikita')
      user2 = User.create(name: 'Janelle')

      # Perform the request
      get :index

      # Expect the @users instance variable to contain all users
      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      # Create a sample user
      user = User.create(name: 'Nikita')

      # Perform the request
      get :show, params: { id: user.id }

      # Expect the response status to be 200 (OK)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      # Create a sample user
      user = User.create(name: 'Nikita')

      # Perform the request
      get :show, params: { id: user.id }

      # Expect the correct template to be rendered
      expect(response).to render_template(:show)
    end

    it 'assigns the correct user to @user' do
      # Create a sample user
      user = User.create(name: 'Nikita')

      # Perform the request
      get :show, params: { id: user.id }

      # Expect the @user instance variable to contain the correct user
      expect(assigns(:user)).to eq(user)
    end
  end
end