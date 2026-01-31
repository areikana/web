class CreateCooks < ActiveRecord::Migration[8.1]
  def change
    create_table :cooks do |t|
      t.string :health

      t.timestamps
    end
  end
end
