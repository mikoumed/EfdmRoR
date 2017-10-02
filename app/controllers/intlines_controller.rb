class IntlinesController < ApplicationController
before_action :set_intline, only: [:show, :edit, :update, :destroy]
before_action :logged_in_user, only: [:edit, :update, :create, :destroy, :new]

def index
    respond_to do |format|
    format.html
    format.json { render json: IntlinesDatatable.new(view_context) }
  end
end

def new
    if logged_in?
        @intline = current_user.intlines.build
    else
        redirect_to login_path
    end
end

def destroy
    @intline.destroy
    flash[:success] = "Report Line deleted"
    redirect_to request.referrer || root_url
end

def edit
    @intline = Intline.find_by(id: params[:id])
end

def create
    @intline = current_user.intlines.build(intline_params)

    if @intline.save
        @intline.update_attributes(userHS: current_user.name)
        flash[:success] = "Report Line created"
        redirect_to home_path
    else
        render 'static_pages/home'
    end
end

def update
    @intline = Intline.find_by(id: params[:id])
    if @intline.update_attributes(intline_params)
        flash[:success] = "Report line updated"
        redirect_to home_path
    else
        render 'edit'
    end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_intline
    @intline = Intline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def intline_params
    params.require(:intline).permit(:created_at, :lineName, :ticketN, :remHS)
  end
end
