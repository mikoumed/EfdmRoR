class ChecklistsController < ApplicationController


	before_action :set_checklist, only:[:edit, :show, :update, :destroy]


	def new

	@checklist = Checklist.new

		if current_user.admin?
	           @users = User.all
        else
			@users = current_team.users
		end
	end

	def show

	end


	# ========================================================================================== #

	    private

	# Before filters

	# set the user according to id
	    def set_checklist
	        @checklist = Checklist.find(params[:id])
	    end


end
