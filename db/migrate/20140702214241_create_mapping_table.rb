class CreateMappingTable < ActiveRecord::Migration
  def change
    create_table :parents_swimmers, id: false do |t|
      t.integer :swimmer_id
      t.integer :parent_id
    end
  end
end
