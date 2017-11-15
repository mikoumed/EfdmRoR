class IssuesController < ApplicationController

  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]

  # ========================================================================================== #

    def index
        if current_user.admin?
	           @issues = Issue.all
           else
               @issues = current_team.issues
        end
    end

	def show
        @issues = current_team.issues
	end

	def new
	    @issue = current_team.issues.build
	end

	def edit
	end

	def create
	    @issue = current_team.issues.build(issue_params)
	    @issue.save
	end

	def update
	    @issue.update_attributes(issue_params)
	end

	def destroy
	    @issue.destroy
	end

# ========================================================================================== #

private

	def set_issue
        @issue = Issue.find(params[:id])
    end

    def issue_params
        params.require(:issue).permit(:title, :date_range, :start, :end, :color, :team_id)
	end
end
