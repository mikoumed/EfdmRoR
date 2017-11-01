class Issue < ApplicationRecord
	validates :title, presence: true
  	attr_accessor :date_range

  def all_day_issue?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
