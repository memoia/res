class Restaurant < ActiveRecord::Base
	#method (:avatar, AvatarUploader)
	mount_uploader :avatar, AvatarUploader
	belongs_to :owner
	validates :name, :phone, :avatar, :owner_id, presence: true
    #replacing default save in rails
    def self.addOwner(restaurant, current_owner)
      restaurant.owner = current_owner
      restaurant.save()
    end
end