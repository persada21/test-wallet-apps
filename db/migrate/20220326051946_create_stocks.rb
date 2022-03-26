class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string  :name
      t.string  :code
      t.string  :stock_type
      t.decimal :balance, precision: 5, scale: 2, default: 0, null: false
      t.timestamps
    end
  end
end