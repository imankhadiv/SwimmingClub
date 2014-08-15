class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.integer :notifiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end
end
