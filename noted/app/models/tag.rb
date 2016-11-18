class Tag < ApplicationRecord
	has_and_belongs_to_many :notes
	validates :tag_name, :presence => true
end
