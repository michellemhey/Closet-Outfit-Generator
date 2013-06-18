class CreateClothings < ActiveRecord::Migration
  def change
    create_table :clothings do |t|
      t.string :name
      t.string :description
      t.integer :type_id
      t.string :image_path
      t.boolean :is_dirty
      t.integer :user_id

      t.timestamps
    end
  end
end
