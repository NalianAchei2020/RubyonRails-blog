class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
    add_index :likes, [:user_id, :post_id]
  end
end
