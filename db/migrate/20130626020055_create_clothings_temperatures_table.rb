class CreateClothingsTemperaturesTable < ActiveRecord::Migration
  def self.up
    create_table :clothings_temperatures, :id => false do |t|
      t.references :clothing
      t.references :temperature
    end
    add_index :clothings_temperatures, [:clothing_id, :temperature_id]
    add_index :clothings_temperatures, :temperature_id
  end

  def self.down
    drop_table :clothings_temperatures
  end
end