class Material < ApplicationRecord
	belongs_to :team
	# validates :team_id, presence: true
	default_scope -> { order(created_at: :desc) }
end
