class IntlinesController < ApplicationController
before_action :set_intline, only: [:edit, :restore, :update, :close, :destroy]
before_action :logged_in_user, only: [:edit, :update, :create, :destroy, :new]
before_action :correct_user, only: [:edit, :update, :destroy]

# ========================================================================================== #

def index
    respond_to do |format|
    format.html
    format.json { render json: IntlinesDatatable.new(view_context, current_user) }
  end
end

def new
    @lines = current_team.lines
    if logged_in?
        @intline = current_user.intlines.build
    else
        redirect_to login_path
    end
end

def edit
end

def restore
end

def close
    if @intline.update_attributes(intline_params)
        @intline.update_attributes(closed: true, userOK: current_user.name)
        flash[:success] = "Report line closed"
        redirect_to intlines_path
    else
        render 'restore'
    end
end

def create
    @intline = current_user.intlines.build(intline_params)
    @intline.update_attributes(userHS: current_user.name, team_id: current_user.team_id) #not the final implemetation
    if @intline.save
        flash[:success] = "Report Line created"
        redirect_to root_path
    else
        render 'static_pages/home'
    end
end

def update
    if @intline.update_attributes(intline_params)
        flash[:success] = "Report line updated"
        redirect_to home_path
    else
        render 'edit'
    end
end


def destroy
    @intline.destroy
    flash[:success] = "Report Line deleted"
    redirect_to request.referrer || root_url
end

# ========================================================================================== #

private

  def set_intline
    @intline = Intline.find_by(params[:id])
  end

  def correct_user
      @intline = current_user.intlines.find_by(id: params[:id])
      if @intline.nil?
          redirect_to root_path
          flash[:danger] = "You don't have rights"
      end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def intline_params
    params.require(:intline).permit(:created_at, :lineName, :ticketN, :remHS, :remOK, :closed_at)
  end
end
