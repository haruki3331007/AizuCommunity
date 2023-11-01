class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
        t.string :name, null: false
        t.string :email, null: false
        t.integer :genre, null: false
        t.string :title, null: false
        t.string :body, null: false

        t.boolean :reply, null: false, default: false
        t.string :reply_body, null: true, default: nil
      t.timestamps
    end
  end
end
