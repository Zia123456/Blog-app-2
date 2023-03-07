require_relative './rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'Software', text: 'software enfineering is the best', comments_counter: 10, likes_counter: 15,
             author_id: 10)
  end

  before { subject.save }

  it 'title must exist' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must be Software engineering' do
    expect(subject.title).to eql 'Software'
  end

  it 'title should be maximum 250 words' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'text must be valid' do
    expect(subject.text).to eql 'software enfineering is the best'
  end

  it 'comments counter must exist' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter must be valid' do
    expect(subject.comments_counter).to eql 10
  end

  it 'comments counter must be greater >= 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments counter must be integer' do
    subject.comments_counter = 1.1
    expect(subject).to_not be_valid
  end

  it 'likes counter must exist' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be valid' do
    expect(subject.likes_counter).to eql 15
  end

  it 'likes counter must be >= 0' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'likes counter must be integer' do
    subject.likes_counter = 11.10
    expect(subject).to_not be_valid
  end
end
