class Like < ApplicationRecord
  belongs_to :users, class_name: 'Users', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Posts', foreign_key: 'post_id'

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
