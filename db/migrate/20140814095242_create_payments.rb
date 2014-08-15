class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :swimmer, index: true
      t.text :details
      t.decimal :amount, precision: 8, scale:2
      t.boolean :paid, default: false
      t.date :due_date
      t.datetime :paid_date

      t.timestamps
    end
  end
end
