class Team < ApplicationRecord
	has_many :users
	has_many :intlines
	has_many :events
	has_many :intequipments

	# validates :name, presence: true
end
