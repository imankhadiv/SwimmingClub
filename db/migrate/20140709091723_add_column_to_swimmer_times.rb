class AddColumnToSwimmerTimes < ActiveRecord::Migration
  def change
    rename_column :swimmer_times, :length, :distance
    add_column :swimmer_times, :age, :integer
  end
end
