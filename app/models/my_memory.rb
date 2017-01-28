class MyMemory < ApplicationRecord
	mount_uploader :image, MyMemoryImageUploader
	has_many :melocations
	has_many :locations, through: :melocations
	# has_and_belongs_to_many :locations
	# belongs_to :theme
	belongs_to :user

	accepts_nested_attributes_for :locations
	# accepts_nested_attributes_for :theme
end
