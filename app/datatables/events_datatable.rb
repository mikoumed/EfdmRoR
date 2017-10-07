class EventsDatatable < ApplicationDatatable

	private

	def data
		events.map do |event|
			[].tap do |column|
				column << event.created_at.strftime("%d-%-m-%y-%-H:%M")
				column << event.object
				column << event.content
				column << event.user.name

				links = []
				links << link_to('show', intline)
				links << link_to('Edit', edit_intline_path(intline))
				links << link_to('Destroy',intline, method: :delete, data: { confirm: 'Are you sure?' })
				column << links.join(' | ')

			end
		end
	end

	def count
		Event.count
	end

	def total_entries
		events.total_entries
	end

	def events
		@events ||= fetch_events
	end

	def fetch_events
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end
		events = Event.order("#{sort_column} #{sort_direction}")
		events = events.page(page).per_page(per_page)
		events = events.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(Created_at object content user)
	end

	def sort_column
    	columns[params[:order]['0'][:column].to_i]
  	end

  	def sort_direction
    	params[:order]['0'][:dir] == "asc" ? "desc" : "asc"
  	end
end
