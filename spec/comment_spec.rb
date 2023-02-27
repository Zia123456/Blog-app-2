require_relative './rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                     posts_counter: 0)
  post = Post.create(title: 'Bio', text: 'Teacher from Poland', comments_counter: 0, likes_counter: 0, author: user)
  subject { Comment.new(text: 'Hi', author: user, post:) }

  before { subject.save }

  it 'comments counter must be 1' do
    expect(post.comments_counter).to eq 1
  end

  it 'error when user is empty' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'error when post is empty' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
