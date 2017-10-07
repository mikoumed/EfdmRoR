class IntequipmentsController < ApplicationController
  before_action :set_intequipment, only: [:show, :edit, :update, :destroy]

  # GET /intequipments
  # GET /intequipments.json
  def index
      respond_to do |format|
      format.html
      format.json { render json: IntequipmentsDatatable.new(view_context) }
    end
  end

  # GET /intequipments/1
  def show
  end

  # GET /intequipments/new
  def new
    @intequipment = Intequipment.new
  end

  # GET /intequipments/1/edit
  def edit
  end

  # POST /intequipments
  def create
    @intequipment = Intequipment.new(intequipment_params)
  end

  # PATCH/PUT /intequipments/1
  def update
  end

  # DELETE /intequipments/1
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intequipment
      @intequipment = Intequipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intequipment_params
      params.fetch(:intequipment, {})
    end
end
