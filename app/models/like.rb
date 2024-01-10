
# The `Like` class represents the association between a user and a post indicating that the user has liked the post.
# It is a join model that belongs to both a user and a post.
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
