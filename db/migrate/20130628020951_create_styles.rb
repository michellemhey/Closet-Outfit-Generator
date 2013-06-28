class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :label

      t.timestamps
    end
  end
end
