class Intline < ApplicationRecord


    belongs_to :user
    belongs_to :team

  	# default_scope -> { order(created_at: :desc) }
  	validates :user_id, presence: true
end
