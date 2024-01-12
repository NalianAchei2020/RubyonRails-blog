class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
