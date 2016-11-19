class Note < ApplicationRecord
	has_one :tag
  accepts_nested_attributes_for :tag
end
