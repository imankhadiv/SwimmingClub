class CreateMedicalConditions < ActiveRecord::Migration
  def change
    create_table :medical_conditions do |t|
      t.text :medical_history,null: false, default: ''
      t.string :allergies,    null: false, default: ''
      t.text :medication,   null: false, default: ''
      t.string :doctor,       null: false, default: ''
      t.string :disability,   null: false, default: ''
      t.references :swimmer, index: true

      t.timestamps
    end
  end
end
