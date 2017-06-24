class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :content
      t.integer :image_id
      t.integer :parent_id
      t.integer :reply_id
      
      t.timestamps
    end
  end
end
