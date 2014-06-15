class CreateSwimmers < ActiveRecord::Migration
  def change
    create_table :swimmers do |t|
      t.string :asa_number
      t.string :asa_category
      t.date :date_of_birth
      t.string :sex
      t.string :photo_consent
      t.string :current_squad
      t.references :user, index: true

      t.timestamps
    end
  end
end
