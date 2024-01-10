# frozen_string_literal: true

# This migration creates the 'users' table in the database.
# It includes columns for the user's name, photo, biography,
# update timestamp, creation timestamp, and a counter for posts.
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.datetime :updated_at
      t.datetime :created_at
      t.integer :posts_counter

      t.timestamps
    end
  end
end
