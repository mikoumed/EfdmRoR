class LinesController < ApplicationController

  # GET /lines
  # GET /lines.json
  def index
    @lines = Line.all
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
  end

  # GET /lines/new
  def new
    @line = Line.new
  end

  # GET /lines/1/edit
  def edit
  end

  # POST /lines
  # POST /lines.json
  def create
      @selectedTeam = Team.find_by(id: params[:line][:team_id])
      @line = @selectedTeam.lines.build(line_params)
      if @line.save
          flash[:success] = "line created"
          redirect_to lines_path
      else
          render 'static_pages/home'
      end
  end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  def update
      @line = Line.find(params[:id])
      if @line.update_attributes(line_params)
          flash[:success] = "Line updated"
          redirect_to lines_path
      else
          render 'edit'
      end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
      Line.find(params[:id]).destroy
      flash[:success] = "Line deleted"
      redirect_to lines_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:name, :team_id)
    end
end
