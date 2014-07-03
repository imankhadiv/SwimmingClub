class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :relation
      t.references :user, index: true

      t.timestamps
    end
  end
end
