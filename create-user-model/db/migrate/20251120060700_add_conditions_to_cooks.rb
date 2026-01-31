class AddConditionsToCooks < ActiveRecord::Migration[8.0]
  def change
    add_column :cooks, :conditions, :json
  end
end
