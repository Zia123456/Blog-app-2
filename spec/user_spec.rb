require_relative './rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'in love with ruby on rails', posts_counter: 10) }

  before { subject.save }

  it 'name must exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name must be Zia' do
    expect(subject.name).to eql 'Zia'
  end

  it 'photo must be valid' do
    expect(subject.photo).to eql 'https://unsplash.com/photos/F_-0BxGuVvo'
  end

  it 'bio must be valid' do
    expect(subject.bio).to eql 'in love with ruby on rails'
  end

  it 'posts counter must exist' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter must be valid' do
    expect(subject.posts_counter).to eql 10
  end

  it 'posts counter must be integer' do
    subject.posts_counter = 11.10
    expect(subject).to_not be_valid
  end

  it 'posts counter should be >= 0' do
    subject.posts_counter = -4
    expect(subject).to_not be_valid
  end

  it 'must return the 3 recent posts of user' do
    expect(subject.recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
  end
end
