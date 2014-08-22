class AddColumnToSwimmer < ActiveRecord::Migration
  def change
    add_column :swimmers, :email_parent, :boolean, default: false
  end
end
