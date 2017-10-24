class MaterialsController < ApplicationController

	def index
		@materials = Material.all
	end

	def destroy
		Material.find(params[:id]).destroy
		flash[:success] = "Material deleted"
		redirect_to materials_url
	end

	def show

	end

	def update
		@material = Material.find(params[:id])
		if @material.update_attributes(material_params)
			flash[:success] = "Material updated"
            redirect_to materials_path
		else
            render 'edit'
		end
	end

	def edit
		@material = Material.find(params[:id])
	end

	def create
		@selectedTeam = Team.find_by(id: params[:material][:team_id])
		@material = @selectedTeam.materials.build(material_params)
		if @material.save
			flash[:success] = "Material created"
			redirect_to materials_path
		else
			render 'static_pages/home'
		end
	end

	def new
		@material = Material.new
	end


	private

	def material_params
		params.require(:material).permit(:name, :team_id)
	end
end
