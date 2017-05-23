class CreateFeedBacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_backs do |t|
      t.integer :user_id
      t.integer :image_id
      t.integer :feed_back_type

      t.timestamps
    end
  end
end
