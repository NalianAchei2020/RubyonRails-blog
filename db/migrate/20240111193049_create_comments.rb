class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.text :text
      t.timestamps
    end
    add_index :comments, %i[user_id post_id]
  end
end
