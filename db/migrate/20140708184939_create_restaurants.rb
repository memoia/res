class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :desc
      t.string :full_address
      t.string :phone

      t.timestamps
    end
  end
end
