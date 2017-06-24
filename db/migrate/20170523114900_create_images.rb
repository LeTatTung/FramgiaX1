class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :user_id
      t.integer :category_id
      t.string :description
      t.string :address
      t.integer :like_number, default: 0
      t.integer :comment_number, default: 0
      t.integer :share_id 
      t.integer :sharer_id
      t.string :share_description

      t.timestamps
    end
  end
end
