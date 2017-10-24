class EventsDatatable < ApplicationDatatable
delegate :edit_event_path, to: :@view
	private

	def data
		events.map do |event|
			[].tap do |column|
				column << event.created_at.strftime("%d-%-m-%y-%-H:%M")
				column << event.object
				column << event.user.name
				column << event.content


				links = []
				links << link_to('Edit', edit_event_path(event))
				links << link_to('Destroy',event, method: :delete, data: { confirm: 'Are you sure?' })
				column << links.join(' | ')

			end
		end
	end

	def users_data
		Event.where(team_id: @user.team_id)
	end

	def count
		users_data.count
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
		events = users_data.order("#{sort_column} #{sort_direction}")
		events = events.page(page).per_page(per_page)
		events = events.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(Created_at object content userName)
	end

	def sort_column
    	columns[params[:order]['0'][:column].to_i]
  	end

  	def sort_direction
    	params[:order]['0'][:dir] == "asc" ? "desc" : "asc"
  	end
end
