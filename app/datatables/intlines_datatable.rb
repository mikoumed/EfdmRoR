class IntlinesDatatable < ApplicationDatatable
delegate :edit_intline_path, to: :@view
delegate :restore_intline_path, to: :@view
	private

	def data
		intlines.map do |intline|
			[].tap do |column|
				column << intline.created_at.strftime("[%d-%m-%y][%H:%M]")
				column << intline.lineName
				column << intline.ticketN
				column << intline.remHS
				column << intline.userHS
				column << intline.userOK
				column << intline.remOK
				column << intline.closed_at.try(:strftime, "[%d-%m-%y][%H:%M]")

				links = []
				links << link_to('', restore_intline_path(intline), class:'fa fa-pencil-square-o')
				column << links.join(' | ')
			end
		end
	end

	def users_data
		Intline.where(team_id: @user.team_id, closed: true)
	end

	def count
		users_data.count
	end

	def total_entries
		intlines.total_entries
	end

	def intlines
		@intlines ||= fetch_intlines
	end

	def fetch_intlines
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end
		intlines = users_data.order("#{sort_column} #{sort_direction}")
		intlines = intlines.page(page).per_page(per_page)
		intlines = intlines.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(Created_at lineName ticketN remHS userHS Panel)
	end

	def sort_column
    	columns[params[:order]['0'][:column].to_i]
  	end

  	def sort_direction
    	params[:order]['0'][:dir] == "asc" ? "desc" : "asc"
  	end
end
