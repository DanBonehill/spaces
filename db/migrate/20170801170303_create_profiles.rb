class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.integer :member_id

      t.timestamps
    end
  end
end
