class IntequipmentsController < ApplicationController
  before_action :set_intequipment, only: [:edit, :update, :destroy]

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
    @materials = Material.where("team_id = #{current_user.team_id}")
    @intequipment = current_user.intequipments.build
  end

  # GET /intequipments/1/edit
  def edit
      @materials = Material.where("team_id = #{current_user.team_id}")
      @intequipment = Intequipment.find_by(id: params[:id])
  end

  # POST /intequipments
  def create
    @intequipment = current_user.intequipments.build(intequipment_params)
    @intequipment.update_attributes(userHS: current_user.name, team_id: current_user.team_id)
    if @intequipment.save
        flash[:success] = "Equipement report created"
        redirect_to intequipments_path
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def intequipment_params
      params.require(:intequipment).permit(:created_at, :ticketN, :equipmentName, :remHS)
    end
end
