require_relative 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe 'GET index' do
    it 'should return status 200 ok code and renders the correct template' do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET show' do
    let(:user) { User.create(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'in love with ruby on rails', posts_counter: 10) }

    it 'should return status 200 ok code and renders the correct template' do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end

    it 'should includes the correct text in the response body' do
      get user_path(user)
      expect(response.body).to include('Here is a details of a single user')
    end
  end

  describe 'GET index' do
    let(:user) { User.create(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'in love with ruby on rails', posts_counter: 10) }
    it 'should return status 200 ok code and renders the correct template' do
      get user_posts_path(user)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of posts')
    end
  end

  describe 'GET show' do
    let(:user) { User.create(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'in love with ruby on rails', posts_counter: 10) }
    let(:post) do
      Post.create(title: 'Software', text: 'software enfineering is the best', comments_counter: 10, likes_counter: 15,
                  author: user)
    end

    it 'should return status 200 ok code and renders the correct template' do
      get user_post_path(post.author, post)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end

    it 'should includes the correct text in the response body' do
      get user_post_path(post.author, post)
      expect(response.body).to include('Here is a single post')
    end
  end
end
