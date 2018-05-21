class CreateCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :circles do |t|
      t.integer :user_id
      t.string :circle_name
      t.text :circle_content
      t.string :circle_image

      t.timestamps
    end
  end
end
