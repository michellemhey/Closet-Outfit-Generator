class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.integer :type_class_id
      t.string :description

      t.timestamps
    end
  end
end
