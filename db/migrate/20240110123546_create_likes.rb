# frozen_string_literal: true

# This migration creates the 'likes' table in the database.
# Each like belongs to a user and a post, indicating that the user has liked the post.
class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
