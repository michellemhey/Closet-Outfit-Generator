class CreateClothingsOutfitsTable < ActiveRecord::Migration
  def self.up
    create_table :clothings_outfits, :id => false do |t|
      t.references :clothing
      t.references :outfit
    end
    add_index :clothings_outfits, [:clothing_id, :outfit_id]
    add_index :clothings_outfits, :outfit_id
  end

  def self.down
    drop_table :clothings_outfits
  end
end
