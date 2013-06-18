class CreateTypeClasses < ActiveRecord::Migration
  def change
    create_table :type_classes do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end
