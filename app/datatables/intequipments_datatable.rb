class IntequipmentsDatatable < ApplicationDatatable
delegate :edit_intequipment_path, to: :@view
delegate :restore_intequipment_path, to: :@view

	private

	def data
		intequipments.map do |intequipment|
			[].tap do |column|
				column << intequipment.created_at.strftime("[%d-%m-%y][%H:%M]")
				column << intequipment.equipmentName
				column << intequipment.ticketN
				column << intequipment.remHS
				column << intequipment.userHS
				column << intequipment.userOK
				column << intequipment.remOK
				column << intequipment.closed_at.try(:strftime, "[%d-%m-%y][%H:%M]")

				links = []
				links << link_to('', restore_intequipment_path(intequipment), class:'fa fa-pencil-square-o')
				column << links.join(' | ')
			end
		end
	end

	def users_data
		Intequipment.where(team_id: @user.team_id, closed: true)
	end

	def count
		users_data.count
	end

	def total_entries
		intequipments.total_entries
	end

	def intequipments
		@intequipments ||= fetch_intequipments
	end

	def fetch_intequipments
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end
		intequipments = users_data.order("#{sort_column} #{sort_direction}")
		intequipments = intequipments.page(page).per_page(per_page)
		intequipments = intequipments.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(Created_at equipmentName ticketN remHS userHS Panel)
	end

	def sort_column
    	columns[params[:order]['0'][:column].to_i]
  	end

  	def sort_direction
    	params[:order]['0'][:dir] == "asc" ? "desc" : "asc"
  	end
end
