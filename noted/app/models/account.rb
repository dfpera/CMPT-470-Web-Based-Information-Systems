class Account < ApplicationRecord
	has_many :notes
	validates :username, :presence => true, :uniqueness => true
	validates :password, :presence => true
	validates :first_name, :presence => true
end
