class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations
	mount_uploaders :images, AvatarUploader

	def self.search(search)
		where("location LIKE ?", "%#{search}%")
	end
	
	
end
