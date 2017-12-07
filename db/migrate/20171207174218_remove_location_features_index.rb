class RemoveLocationFeaturesIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index "locations", name: "index_locations_on_features"
    remove_column :locations, :features, :string
  end
end
