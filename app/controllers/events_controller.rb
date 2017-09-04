class EventsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :edit, :update]
	before_action :correct_user, only: [:create, :destroy, :edit, :update]

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created"
			redirect_to root_url
		else
			@feed_items = [params]
			render 'static_pages/home'
		end
	end

	def destroy
		@event.destroy
    	flash[:success] = "Micropost deleted"
    	redirect_to request.referrer || root_url
	end

	def edit
		@event = Event.find_by(id: params[:id])
	end

	def update
		# @event = Event.find_by(id: params[:id])
		if @event.update_attributes(event_params)
			flash[:success] = "Post updated"
			redirect_to root_url
		else
			render 'edit'
		end
	end

	private

	def event_params
		params.require(:event).permit(:content)
	end

	def correct_user
	 	@event = current_user.events.find_by(id: params[:id])
	 	redirect_to root_url if @event.nil?
   	end
end
