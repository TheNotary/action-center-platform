class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :location_id
      t.string :name
      t.string :symbol
      t.string :location_type

      t.timestamps
    end
  end
end