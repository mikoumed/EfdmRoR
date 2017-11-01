class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
	def index
	    @issues = Issue.where(start: params[:start]..params[:end])
	end

	def show
	end

	def new
	  @issue = Issue.new
	end

	def edit
	end

	def create
	  @issue = Issue.new(issue_params)
	  @issue.save
	end

	def update
	  @issue.update(issue_params)
	end

	def destroy
	  @issue.destroy
	end

	private
	  def set_issue
	    @issue = Issue.find(params[:id])
	  end

	  def issue_params
	    params.require(:issue).permit(:title, :date_range, :start, :end, :color)
	  end
end
