class Tag < ApplicationRecord
	validates :account_id,
		:presence => true
	validates :tag_name,
		:presence => true,
		:uniqueness => {scope: :account_id},
		:length => {:minimum => 3, :maximum => 25}
end
