class ChangePaymentColumn < ActiveRecord::Migration
  def change

    remove_column :payments, :paid_date
    add_column    :payments, :paid_date, :date
  end
end
