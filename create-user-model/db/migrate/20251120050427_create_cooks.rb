class CreateCooks < ActiveRecord::Migration[8.0]
  def change
    create_table :cooks do |t|
      t.string :health
      t.string :food
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
