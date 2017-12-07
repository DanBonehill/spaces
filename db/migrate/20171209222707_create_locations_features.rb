class CreateLocationsFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :locations_features, id: false do |t|
      t.belongs_to :location, index: true
      t.belongs_to :feature, index: true
    end

    remove_column :features, :location_id, :integer
  end
end
