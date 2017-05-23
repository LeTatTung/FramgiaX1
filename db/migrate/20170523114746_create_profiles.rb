class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :phone_number
      t.integer :followed_number
      t.date :birthday
      t.string :place_birth

      t.timestamps
    end
  end
end
