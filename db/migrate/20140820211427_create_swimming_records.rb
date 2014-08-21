class CreateSwimmingRecords < ActiveRecord::Migration
  def change
    create_table :swimming_records do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :stroke
      t.integer :distance
      t.string :level
      t.string :meet
      t.string :venue
      t.integer :time
      t.integer :age
      t.date :date
      t.string :region
      t.string :region
      t.string :region_code

      t.timestamps
    end
  end
end
