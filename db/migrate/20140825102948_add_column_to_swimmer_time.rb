class AddColumnToSwimmerTime < ActiveRecord::Migration
  def change
    add_column :swimmer_times, :asa_meet, :boolean, default: false
    add_column :swimmer_times, :asa_top_ten, :boolean, default: false
    add_column :swimmer_times, :bml, :string, default: ''
  end
end
