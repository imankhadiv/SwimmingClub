class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :time, :start
    add_column :events, :finish, :time
    remove_column :events, :duration, :integer

  end
end
