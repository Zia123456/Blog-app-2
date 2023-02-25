class Post < ApplicationRecord
  belongs_to :users, class_name: 'Users', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comments', foreign_key: 'post_id'
  has_many :likes, class_name: 'Likes', foreign_key: 'post_id'

  after_save :update_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
