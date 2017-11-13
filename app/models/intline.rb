class Intline < ApplicationRecord


    belongs_to :user
    belongs_to :team

    validates :remHS, presence: true
    validates :lineName, presence: true

  	# default_scope -> { order(created_at: :desc) }
  	validates :user_id, presence: true
end
