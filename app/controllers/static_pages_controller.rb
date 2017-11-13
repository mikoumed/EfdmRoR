class StaticPagesController < ApplicationController

    def home
        if logged_in?
            @events = Event.where(team_id: current_user.team_id)
            @intlines = Intline.where(team_id: current_user.team_id , closed: false)
            @intequipments = Intequipment.where(team_id: current_user.team_id , closed: false)
        else
            redirect_to login_path
        end
    end
end
