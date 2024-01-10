# frozen_string_literal: true

# This migration creates the 'posts' table in the database.
# Each post belongs to a user and has a title, text content,
# creation timestamp, update timestamp, comments counter, and likes counter.
class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
