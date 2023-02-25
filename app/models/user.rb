class User < ApplicationRecord
  has_many :comments, class_name: 'Comments', foreign_key: 'author_id'
  has_many :posts, class_name: 'Posts', foreign_key: 'author_id'
  has_many :likes, class_name: 'Likes', foreign_key: 'author_id'

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
