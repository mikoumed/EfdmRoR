module SessionsHelper

# Logs in the given user.
	def log_in_as(user)
		session[:user_id] = user.id
	end

# Confirms an admin user.
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end

# Returns the team of the current user
	def current_team
		Team.find_by(id: current_user.team_id)
	end

# Verify if correct User
	def correct_user
	    @user = User.find(params[:id])
	    unless current_user?(@user)
	        flash[:danger] = "You don't have rights"
			redirect_back_or(root_url)
	    end
	end

# Returns the current logged-in user (if any).
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

# Logs out the current user.
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

# Returns true if the given user is the current user.
 	def current_user?(user)
   		user == current_user
 	end

# Redirects to stored location (or to the default).
  	def redirect_back_or(default)
    	redirect_to(session[:forwarding_url] || default)
	    session.delete(:forwarding_url)
	end

# Stores the URL trying to be accessed.
	def store_location
    	session[:forwarding_url] = request.original_url if request.get?
	end
end
