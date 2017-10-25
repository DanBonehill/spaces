class ChangePriceDataType < ActiveRecord::Migration[5.1]
  def change
    change_table :locations do |t|
      t.change :price, :float
    end
  end
end
