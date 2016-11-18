class Tag < ApplicationRecord
	has_and_belongs_to_many :notes
	belongs_to :accounts
	validates :tag_name, :presence => true
end
