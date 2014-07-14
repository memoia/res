class AddRestaurantIdToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :restaurant_id, :integer
  end
end
