class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.integer :duration
      t.string :title
      t.text :details
      t.references :user, index: true
      t.boolean :notification

      t.timestamps
    end
  end
end
