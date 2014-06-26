class CreateSwimmerTimes < ActiveRecord::Migration
  def change
    create_table :swimmer_times do |t|
      t.references :swimmer, index: true
      t.string :stroke
      t.integer :length
      t.string :times
      t.string :club
      t.string :venue
      t.date :date

      t.timestamps
    end
  end
end
