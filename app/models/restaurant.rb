class Restaurant < ActiveRecord::Base
	#method (:avatar, AvatarUploader)
	mount_uploader :avatar, AvatarUploader
	belongs_to :user
	has_many :reservations
	validates :name, :phone, :avatar, :user_id, presence: true
end