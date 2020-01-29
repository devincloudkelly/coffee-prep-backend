class CreatePreparations < ActiveRecord::Migration[6.0]
  def change
    create_table :preparations do |t|
      t.string :device, default: ''
      t.string :coffee_brand, default: ''
      t.string :coffee_name, default: ''
      t.integer :coffee_amount, default: 0
      t.string :coffee_grind, default: ''
      t.integer :total_water, default: 0
      t.integer :total_time, default: 0
      t.integer :water_temp, default: 200
      t.text :notes, default: ''
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
