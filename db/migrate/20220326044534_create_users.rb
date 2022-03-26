class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :phone_number
      t.date :birth_date
      t.timestamps
    end 

    create_table :accounts do |t|
      t.string :number, unique: true
      t.decimal :balance, precision: 5, scale: 2, default: 0, null: false
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
