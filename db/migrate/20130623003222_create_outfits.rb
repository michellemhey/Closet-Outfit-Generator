class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :name
      t.boolean :is_favorite
      t.date :last_worn
      t.integer :user_id

      t.timestamps
    end
  end
end
