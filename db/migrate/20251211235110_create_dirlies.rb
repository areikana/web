class CreateDirlies < ActiveRecord::Migration[8.0]
  def change
    create_table :dirlies do |t|
      t.text :body

      t.timestamps
    end
  end
end
