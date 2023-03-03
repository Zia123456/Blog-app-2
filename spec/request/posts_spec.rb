require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe 'GET #index' do
    let(:user) { User.create(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher from maxico', posts_counter: 1) }
    before(:example) { get user_posts_path(user) } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher from maxico', posts_counter: 1) }
    let(:post) do
      Post.create(title: 'software', text: 'I love software engineering', comments_counter: 1, likes_counter: 1,
                  author: user)
    end

    before(:example) { get user_post_path(user, post) } # get(:show)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template(:show)
    end
  end
end
