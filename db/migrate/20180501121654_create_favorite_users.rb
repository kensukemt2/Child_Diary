class CreateFavoriteUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_users do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :favorite_users, :follower_id
    add_index :favorite_users, :followed_id
    add_index :favorite_users, [:follower_id, :followed_id], unique: true
  end
end
