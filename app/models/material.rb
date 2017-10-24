class Material < ApplicationRecord
	belongs_to :team
	default_scope -> { order(created_at: :desc) }
	validates :team_id, presence: true
end
