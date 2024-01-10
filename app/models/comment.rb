# frozen_string_literal: true

# Represents a comment made by a user on a post.
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
