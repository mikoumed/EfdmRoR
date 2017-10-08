class Intequipment < ApplicationRecord
	belongs_to :user
	belongs_to :team
	validates :user_id, presence: true
end
