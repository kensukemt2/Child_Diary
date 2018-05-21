class CreateBordComments < ActiveRecord::Migration[5.1]
  def change
    create_table :bord_comments do |t|
      t.integer :user_id
      t.text :comment
      t.integer :trouble_bord_id

      t.timestamps
    end
  end
end
