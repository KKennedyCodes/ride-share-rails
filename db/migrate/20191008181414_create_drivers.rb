class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :vin
      t.string :make
      t.string :model
      t.boolean :active

      t.timestamps
    end
  end
end