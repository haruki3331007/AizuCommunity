class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: true
      t.integer :post_id, null: true
      t.integer :comment_id, null: true
      t.timestamps
    end
  end
end
