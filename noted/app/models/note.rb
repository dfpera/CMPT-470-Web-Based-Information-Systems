class Note < ApplicationRecord
	belongs_to :account
	has_and_belongs_to_many :tags

	validates :account_id,
		:presence => true
	validates :permalink,
		:presence => true,
		:uniqueness => true,
		:length => {:minimum => 3, :maximum => 255}
	validates :title,
		:presence => true,
		:length => {:maximum => 255}
	validates :text,
		:length => {:maximum => 65535}
end
