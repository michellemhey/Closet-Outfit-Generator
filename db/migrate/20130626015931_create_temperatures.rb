class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.string :label
      t.integer :low
      t.integer :high

      t.timestamps
    end
  end
end
