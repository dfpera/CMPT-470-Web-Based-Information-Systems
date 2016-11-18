class Note < ApplicationRecord
	belongs_to :account
	has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tag
end
