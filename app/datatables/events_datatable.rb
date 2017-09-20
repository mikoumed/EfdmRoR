class EventsDatatable < ApplicationDatatable

	private

	def data
		events.map do |event|
			[].tap do |column|
				column << event.content
				column << event.user.name
				column << event.created_at
				column << event.updated_at
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
		events = Event.order("#{sort_column} #{sort_direction}")
	   events = events.page(page).per_page(per_page)
	   if params[:search]["value"] != "" #<-- new
		 events = events.where("name like :search or category like :search", search: "%#{params[:search]["value"]}%") #<--- new
	   end
	   events
		# search_string = []
		# columns.each do |term|
		# 	search_string << "#{term} like :search"
		# end
		# events = Event.order("#{sort_column} #{sort_direction}")
		# events = events.page(page).per_page(per_page)
		# events = events.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(content user_id Created_at Updated_at)
	end

	def sort_column
	#   columns[params[:iSortCol_0].to_i] <-- used in video
	    # columns[params[:order]["0"]["column"].to_i] #<-- works in Rails 4
		columns[params[:order]['0'][:column].to_i]
	end

	def sort_direction
	    params[:order]["0"]["dir"] #<-- works in Rails 4
	#   params[:sSortDir_0] == "desc" ? "desc" : "asc" <-- used in video
	end


end
