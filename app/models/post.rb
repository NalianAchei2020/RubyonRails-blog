# frozen_string_literal: true

# The `Post` class represents a blog post in the application.
# It belongs to an `author` who created the post.
class Post < ApplicationRecord
  belongs_to :author
end
