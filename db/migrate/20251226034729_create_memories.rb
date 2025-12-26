class CreateMemories < ActiveRecord::Migration[8.0]
  def change
    create_table :memories do |t|
      t.string :body

      t.timestamps
    end
  end
end
