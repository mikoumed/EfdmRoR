class IntequipmentsController < ApplicationController
  before_action :set_intequipment, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :create, :destroy, :new]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /intequipments
  # GET /intequipments.json
  def index
      respond_to do |format|
      format.html
      format.json { render json: IntequipmentsDatatable.new(view_context, current_user) }
    end
  end

  # GET /intequipments/new
  def new
    @materials = current_team.materials
    @intequipment = current_user.intequipments.build
  end

  # GET /intequipments/1/edit
  def edit
      @intequipment = Intequipment.find_by(id: params[:id])
  end

  def restore
      @intequipment = Intequipment.find_by(id: params[:id])
  end

  def close
      @intequipment = Intequipment.find_by(id: params[:id])
      if @intequipment.update_attributes(intequipment_params)
          @intequipment.update_attributes(closed: true, userOK: current_user.name)
          flash[:success] = "Report equipment closed"
          redirect_to intequipments_path
      else
          render 'restore'
      end
  end

  # POST /intequipments
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

  # PATCH/PUT /intequipments/1
  def update
      @intequipment = Intequipment.find_by(id: params[:id])
      if @intequipment.update_attributes(intequipment_params)
          flash[:success] = "Equipement Report updated"
          redirect_to home_path
      else
          render 'edit'
      end
  end

  # DELETE /intequipments/1
  def destroy
      @intequipment.destroy
      flash[:success] = "Equipment Report deleted"
      redirect_to request.referrer || root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intequipment
      @intequipment = Intequipment.find(params[:id])
    end

    def correct_user
        @intequipment = current_user.intequipments.find_by(id: params[:id])
        if @intequipment.nil?
            redirect_to root_path
            flash[:danger] = "You don't have rights"
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intequipment_params
      params.require(:intequipment).permit(:created_at, :ticketN, :equipmentName, :remHS, :remOK, :closed_at)
    end
end
