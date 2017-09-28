class AddPriceToFoodItems < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :price, :decimal
  end
end
