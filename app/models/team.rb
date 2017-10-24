class Team < ApplicationRecord

	has_many :users
	has_many :lines
	has_many :materials
	has_many :events
	has_many :intlines
	has_many :intequipments

	validates :name, presence: true
end
