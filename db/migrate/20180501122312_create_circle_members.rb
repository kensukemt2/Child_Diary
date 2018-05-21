class CreateCircleMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :circle_members do |t|
      t.integer :circle_id
      t.integer :user_id

      t.timestamps
    end
  end
end
