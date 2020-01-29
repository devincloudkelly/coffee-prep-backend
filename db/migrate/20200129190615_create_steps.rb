class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :action, default: ''
      t.integer :duration, default: 0
      t.integer :amount, default: 0
      t.integer :order, default: 0
      t.string :directions, default: ''
      t.references :preparation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
