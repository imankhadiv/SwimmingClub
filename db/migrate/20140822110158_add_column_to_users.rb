class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dbs_check, :boolean
    add_column :users, :dbs_expiry_date, :date, default: Date.today
  end
end
