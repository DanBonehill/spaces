class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.integer :location_id
      t.string :name

      t.timestamps
    end
  end
end
