class IntequipmentsController < ApplicationController
  before_action :set_intequipment, only: [:edit, :restore, :update, :close, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :create, :destroy, :new, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]

# ========================================================================================== #

  def index
      respond_to do |format|
      format.html
      format.json { render json: IntequipmentsDatatable.new(view_context, current_user) }
    end
  end

  def new
    @materials = current_team.materials
    @intequipment = current_user.intequipments.build
  end

  def edit
  end

  def restore
  end

  def close
      if @intequipment.update_attributes(intequipment_params)
          @intequipment.update_attributes(closed: true, userOK: current_user.name)
          flash[:success] = "Report equipment closed"
          redirect_to intequipments_path
      else
          render 'restore'
      end
  end

  def create
    @intequipment = current_user.intequipments.build(intequipment_params)
    @intequipment.update_attributes(userHS: current_user.name, team_id: current_user.team_id)
    if @intequipment.save
        flash[:success] = "Equipement report created"
        redirect_to root_path
    else
        redirect_to home_path
    end
  end

  def update
      if @intequipment.update_attributes(intequipment_params)
          flash[:success] = "Equipement Report updated"
          redirect_to home_path
      else
          render 'edit'
      end
  end

  def destroy
      @intequipment.destroy
      flash[:success] = "Equipment Report deleted"
      redirect_to request.referrer || root_url
  end


# ========================================================================================== #

  private

    def set_intequipment
        @intequipment = Intequipment.find_by(id: params[:id])
    end

    def correct_user
        @intequipment = current_user.intequipments.find_by(id: params[:id])
        if @intequipment.nil?
            redirect_to root_path
            flash[:danger] = "You don't have rights"
        end
    end

    def intequipment_params
      params.require(:intequipment).permit(:created_at, :ticketN, :equipmentName, :remHS, :remOK, :closed_at)
    end
end
