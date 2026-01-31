class CreateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :records do |t|
      t.integer :total_calories
      t.text :memo
      t.string :meal_type
      t.date :date

      t.timestamps
    end
  end
end