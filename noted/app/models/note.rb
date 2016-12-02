class Note < ApplicationRecord
	validates :title, :presence => true
	has_many :tag, :dependent => :delete_all
end
