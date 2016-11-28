class Note < ApplicationRecord
	validates :title, :presence => true
	has_many :tag, :dependent => :delete_all
  accepts_nested_attributes_for :tag
end
