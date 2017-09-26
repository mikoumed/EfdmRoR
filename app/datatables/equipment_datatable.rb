class equipmentsDatatable < ApplicationDatatable
delegate :edit_equipment_path, to: :@view
	private

	def data
		equipments.map do |equipment|
			[].tap do |column|
				column << equipment.created_at.strftime("%d-%-m-%y-%-H:%M")
				column << equipment.equipmentName
				column << equipment.ticketN
				column << equipment.remHS
				column << equipment.userHS

				links = []
				links << link_to('show', equipment)
				links << link_to('Edit', edit_equipment_path(equipment))
				links << link_to('Destroy',equipment, method: :delete, data: { confirm: 'Are you sure?' })
				column << links.join(' | ')
			end
		end
	end

	def count
		equipment.count
	end

	def total_entries
		equipments.total_entries
	end

	def equipments
		@equipments ||= fetch_equipments
	end

	def fetch_equipments
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end
		equipments = equipment.order("#{sort_column} #{sort_direction}")
		equipments = equipments.page(page).per_page(per_page)
		equipments = equipments.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
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
