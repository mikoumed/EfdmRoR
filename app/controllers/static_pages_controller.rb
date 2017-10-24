class StaticPagesController < ApplicationController

    def home
        if logged_in?

            @events = Event.all
            @intlines = Intline.all
            @intequipments = Intequipment.all
            # @feed_items = Event.paginate(page: params[:page], :per_page => 10)
        else
            redirect_to login_path
        end
    end
end
