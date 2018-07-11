class WorkingTeam < ApplicationRecord
	belongs_to :team
	before_save do
  		self.esaRadar.gsub!(/[\[\]\"]/, "") if attribute_present?("esaRadar")
		self.esaCom.gsub!(/[\[\]\"]/, "") if attribute_present?("esaCom")
	end

end
