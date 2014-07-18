class Restaurant < ActiveRecord::Base
	#method (:avatar, AvatarUploader)
	mount_uploader :avatar, AvatarUploader
	belongs_to :owner
	validates :name, :phone, :avatar, :owner_id, presence: true
    #replacing default save in rails
    def self.add_owner(restaurant, current_owner)
      #sets foriegn owner key in restaurant
      restaurant.owner = current_owner
      restaurant.save()
    end

    def self.confirm_owner(restaurant, current_owner, restaurant_params)
      if restaurant.owner == current_owner
        restaurant.update(restaurant_params)
      end
    end
end