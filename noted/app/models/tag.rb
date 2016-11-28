class Tag < ApplicationRecord
	belongs_to :note
	validates :tag_name, :presence => true
end
