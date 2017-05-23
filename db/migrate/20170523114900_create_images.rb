class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :user_id
      t.integer :category_id
      t.string :description
      t.string :address
      t.integer :like_number

      t.timestamps
    end
  end
end
