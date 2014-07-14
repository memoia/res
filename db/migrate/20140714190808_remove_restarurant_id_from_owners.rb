class RemoveRestarurantIdFromOwners < ActiveRecord::Migration
  def change
  	remove_column :owners, :restaurant_id
  end
end
