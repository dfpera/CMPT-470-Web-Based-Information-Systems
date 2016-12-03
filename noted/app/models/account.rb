class Account < ApplicationRecord
	has_secure_password
	has_many :notes
	has_many :tags

	validates :username,
		:presence => true,
		:uniqueness => true,
		:length => {:minimum => 3, :maximum => 25}
	validates :password,
		:presence => true,
		:confirmation => true,
		:length => {:minimum => 5, :maximum => 25}
end
