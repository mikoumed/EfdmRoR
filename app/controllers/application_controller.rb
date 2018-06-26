class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

def index
    @issues = current_team.issues
    @today_issues = @issues.where("end >=  ? and start <= ?", Time.now , Time.now.end_of_day).count
end

private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Returns the team of the current user
  	def current_team
  		Team.find_by(id: current_user.team_id)
  	end

end
