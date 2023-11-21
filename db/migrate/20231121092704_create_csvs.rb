class CreateCsvs < ActiveRecord::Migration[7.0]
  def change
    create_table :csvs do |t|
      t.datetime :timestamp
      t.string :measure_type
      t.integer :measure_float
      t.string :brand
      t.string :serial_number
      t.integer :establishment_id
      t.string :establishment_name
      t.string :establishment_city
      t.integer :establishment_postcode
      t.string :establishment_address
      t.float :establishment_latitude
      t.float :establishment_longitude
      t.integer :room_id
      t.string :room_name

      t.timestamps
    end
  end
end
