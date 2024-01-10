# frozen_string_literal: true

ActiveRecord::Schema[7.1].define(version: 20_240_110_123_819) do
  # These are extensions that must be enabled in order to support this database.
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.text 'text'
    t.datetime 'updated_at'
    t.datetime 'created_at', null: false

    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at', null: false

    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  # Add other create_table blocks for other tables...

  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'

  # Add other add_foreign_key blocks for other tables...
end
