class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :point_of_contact
      t.string :contact_number
      t.integer :max_occupancy
      t.integer :size
      t.decimal :price
      t.text :description
      t.string :features, array: true

      t.timestamps
    end
    add_index :locations, :features, using: 'gin'
  end
end
