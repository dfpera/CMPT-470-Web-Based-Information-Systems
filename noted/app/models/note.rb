class Note < ApplicationRecord
	validates :title, :presence => true
	has_many :tag, :dependent => :delete_all

	validates :account_id,
		:presence => true
	validates :permalink,
		:uniqueness => true,
		:length => {:minimum => 3, :maximum => 255}
	validates :title,
		:presence => true,
		:length => {:maximum => 255}
	validates :text,
		:length => {:maximum => 65000}

end
