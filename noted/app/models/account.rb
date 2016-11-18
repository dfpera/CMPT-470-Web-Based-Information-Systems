class Account < ApplicationRecord
	has_many :notes
	has_many :tags
	validates :username, :presence => true, :uniqueness => true
	validates :password, :presence => true
	validates :first_name, :presence => true
end
