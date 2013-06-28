class CreateClothingsStylesTable < ActiveRecord::Migration
  def self.up
    create_table :clothings_styles, :id => false do |t|
      t.references :clothing
      t.references :style
    end
    add_index :clothings_styles, [:clothing_id, :style_id]
    add_index :clothings_styles, :style_id
  end

  def self.down
    drop_table :clothings_styles
  end
end