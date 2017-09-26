class LinesDatatable < ApplicationDatatable
delegate :edit_line_path, to: :@view
	private

	def data
		lines.map do |line|
			[].tap do |column|
				column << line.created_at.strftime("%d-%-m-%y-%-H:%M")
				column << line.lineName
				column << line.ticketN
				column << line.remHS
				column << line.userHS

				links = []
				links << link_to('show', line)
				links << link_to('Edit', edit_line_path(line))
				links << link_to('Destroy',line, method: :delete, data: { confirm: 'Are you sure?' })
				column << links.join(' | ')
			end
		end
	end

	def count
		Line.count
	end

	def total_entries
		lines.total_entries
	end

	def lines
		@lines ||= fetch_lines
	end

	def fetch_lines
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end
		lines = Line.order("#{sort_column} #{sort_direction}")
		lines = lines.page(page).per_page(per_page)
		lines = lines.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
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
