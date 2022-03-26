class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :code
      t.bigint :grant_id
      t.string :grant_type
      t.bigint :transactable_id
      t.string :transactable_type
      t.string :subject
      t.timestamps
    end

    create_table :top_ups do |t|
      t.decimal    :amount, precision: 5, scale: 2, default: 0, null: false
      t.references :sender, foreign_key: { to_table: :stocks }
      t.references :receiver, foreign_key: { to_table: :accounts }
      t.string :status
      t.timestamps
    end

    create_table :withdraws do |t|
      t.decimal    :amount, precision: 5, scale: 2, default: 0, null: false
      t.string     :receiver_number
      t.references :sender, foreign_key: { to_table: :accounts }
      t.references :receiver, foreign_key: { to_table: :stocks }
      t.string     :status
      t.timestamps
    end

    create_table :transfers do |t|
      t.decimal    :amount, precision: 5, scale: 2, default: 0, null: false
      t.references :sender, foreign_key: { to_table: :accounts }
      t.references :receiver, foreign_key: { to_table: :accounts }
      t.string :status
      t.timestamps
    end

    add_index :transactions, %i[grant_id grant_type]
    add_index :transactions, %i[transactable_id transactable_type]
  end
end
