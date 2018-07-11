class Team < ApplicationRecord

	has_many :users
	has_many :lines
	has_many :materials
	has_many :events
	has_many :intlines
	has_many :intequipments
	has_many :issues
	has_many :checklists
	has_many :working_teams

	validates :name, presence: true
end
