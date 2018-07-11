class WorkingTeamsController < ApplicationController

	before_action :set_workingTeam, only:[:edit, :show, :update, :destroy]

	def index
	end

	def new
		@working_team = WorkingTeam.new
		@users = User.where(team_id: current_user.team_id)
	end

	def edit
	end

	def create
		@working_team = current_team.working_teams.build(working_team_params)
        if @working_team.save
            # if @user.activated?
                flash[:success] = "Working team added!"
            redirect_to @working_team
            # else
            #     flash[:warning] = "Your account will be activated by the administrator soon"
            #     redirect_to root_url # equivalent to redirect_to user_url(@user)
            # end
        else
            redirect_to home_url
        end
	end


	# ========================================================================================== #

	    private

	# permit only the 4 attributes
	    def working_team_params
			# self.esaRadar.reject!(&:blank?)
	        params.require(:working_team).permit(:teamName, :date, :session, :supervisor, esaRadar:[], esaCom:[])
	    end

	# Before filters

	# set the user according to id
	    def set_workingTeam
	        @working_team = WorkingTeam.find(params[:id])
	    end
end
