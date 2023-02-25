class Comment < ApplicationRecord
  belongs_to :users, class_name: 'Users', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Posts', foreign_key: 'post_id'

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
