require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      user = User.create(name: 'Ngoh')
      user.posts.create(title: 'Post 1')
      user.posts.create(title: 'Post 2')

      get :index, params: { user_id: user.id }

      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      user = User.create(name: 'Ngoh')

      get :index, params: { user_id: user.id }

      expect(response).to render_template(:index)
    end

    it 'assigns the correct user to @user' do
      user = User.create(name: 'David')

      get :index, params: { user_id: user.id }

      expect(assigns(:user)).to eq(user)
    end

    it 'assigns the user posts to @posts' do
      user = User.create(name: 'David')
      post1 = user.posts.create(title: 'Post 1')
      post2 = user.posts.create(title: 'Post 2')

      get :index, params: { user_id: user.id }

      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = Post.create(title: 'Post 1')

      get :show, params: { id: post.id }

      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      post = Post.create(title: 'Post 1')

      get :show, params: { id: post.id }

      expect(response).to render_template(:show)
    end

    it 'assigns the correct post to @post' do
      post = Post.create(title: 'Post 1')

      get :show, params: { id: post.id }

      expect(assigns(:post)).to eq(post)
    end
  end
end
