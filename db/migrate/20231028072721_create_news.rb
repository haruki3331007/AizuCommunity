class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :image_id, null: true
      t.timestamps
    end
  end
end
