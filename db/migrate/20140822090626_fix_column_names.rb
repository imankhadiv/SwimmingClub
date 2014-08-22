class FixColumnNames < ActiveRecord::Migration
  def change
    rename_column :swimmer_times, :club, :meet
    add_column :swimmer_times, :level, :string

  end
end
