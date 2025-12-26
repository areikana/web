class AddFoodUrlToCooks < ActiveRecord::Migration[8.0]
  def change
    add_column :cooks, :food_url, :string
  end
end
