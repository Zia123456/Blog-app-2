require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'show index content' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher from maxico', posts_counter: 1) }
    before(:example) { get user_path(user) } # get(:show)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template(:show)
    end
    it 'shows show content' do
      expect(response.body).to include('Here is details of a single user')
    end
  end
end
