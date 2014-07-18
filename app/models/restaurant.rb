class Restaurant < ActiveRecord::Base
	#method (:avatar, AvatarUploader)
	mount_uploader :avatar, AvatarUploader
	belongs_to :owner
	validates :name, :phone, :avatar, :owner_id, presence: true
end