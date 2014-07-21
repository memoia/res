class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :requested_date
      t.text :message
      t.integer :restaurant_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
