class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :location_id
      t.attachment :image_pic
      t.string :caption

      t.timestamps
    end
  end
end
