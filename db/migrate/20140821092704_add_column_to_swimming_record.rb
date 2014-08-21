class AddColumnToSwimmingRecord < ActiveRecord::Migration
  def change
    add_column :swimming_records, :information, :text
  end
end
