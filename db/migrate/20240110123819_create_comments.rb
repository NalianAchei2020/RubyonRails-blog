

# This migration creates the 'comments' table in the database.
# Each comment belongs to a user and a post, and it includes a text content,
# update timestamp, and creation timestamp.
class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :text
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
