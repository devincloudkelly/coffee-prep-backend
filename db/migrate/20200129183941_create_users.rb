class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :email_address, default: ''
      t.string :password, default: ''
      t.boolean :has_aeropress, default: true
      t.boolean :has_chemex, default: false
      t.boolean :has_pourover, default: false

      t.timestamps
    end
  end
end
