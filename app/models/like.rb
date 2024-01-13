class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create :update_likes_counter

  def update_likes_counter
    Post.update_counters(post.id, likes_counter: post.likes.count)
  end
end
