class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # GET /lines
  # GET /lines.json
  # def index
  #   @lines = Line.all
  # end

  # GET /lines/1
  # GET /lines/1.json
  def index
    #   @lines = Line.all
      respond_to do |format|
      format.html
      format.json { render json: LinesDatatable.new(view_context) }
    end
  end

  # GET /lines/new
  def new
      if logged_in?
          @line = current_user.lines.build
      else
          redirect_to login_path
      end
  end

  def destroy
      @line.destroy
      flash[:success] = "Report Line deleted"
      redirect_to request.referrer || root_url
  end

  def edit
      @line = Line.find_by(id: params[:id])
  end

  def create
      @line = current_user.lines.build(line_params)

      if @line.save
          @line.update_attributes(userHS: current_user.name)
          flash[:success] = "Report Line created"
          redirect_to home_path
      else
          render 'static_pages/home'
      end
  end

  def update
      @line = Line.find_by(id: params[:id])
      if @line.update_attributes(line_params)
          flash[:success] = "Report line updated"
          redirect_to home_path
      else
          render 'edit'
      end
  end
  # def create
  #   @line = Line.new(line_params)
  #
  #   # respond_to do |format|
  #   #   if @line.save
  #   #     format.html { redirect_to @line, notice: 'Line was successfully created.' }
  #   #     format.json { render :show, status: :created, location: @line }
  #   #   else
  #   #     format.html { render :new }
  #   #     format.json { render json: @line.errors, status: :unprocessable_entity }
  #   #   end
  #   # end
  # end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  # def update
  #   respond_to do |format|
  #     if @line.update(line_params)
  #       format.html { redirect_to @line, notice: 'Line was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @line }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @line.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /lines/1
  # DELETE /lines/1.json
  # def destroy
  #   @line.destroy
  #   respond_to do |format|
  #     format.html { redirect_to lines_url, notice: 'Line was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:created_at, :lineName, :ticketN, :remHS)
    end
end
