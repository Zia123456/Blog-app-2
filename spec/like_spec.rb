require_relative './rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                     posts_counter: 0)
  post = Post.create(title: 'Bio', text: 'Teacher from Poland', comments_counter: 0, likes_counter: 0, author: user)
  subject { Like.new(author: user, post:) }

  before { subject.save }

  it 'likes counter must be 1' do
    expect(post.likes_counter).to eq 1
  end

  it 'error without author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'error without post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
