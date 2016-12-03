class Tag < ApplicationRecord
	has_and_belongs_to_many :notes
	belongs_to :account

	validates :account_id,
		:presence => true
	validates :tag_name,
		:presence => true,
		:uniqueness => {scope: :account_id},
		:length => {:minimum => 3, :maximum => 25}
end
