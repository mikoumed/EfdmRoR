class UsersController < ApplicationController

    before_action :set_user, only:[:edit, :show, :update, :destroy]
    before_action :logged_in_user, only: [:edit, :update, :show]
    before_action :correct_user,   only: [:edit, :update, :show]
    before_action :admin_user, only:[:destroy]

# ========================================================================================== #

    def new
        @user = User.new
    end

    def edit
    end

    def show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # if @user.activated?
                log_in_as @user

            flash[:success] = "Welcome to EfdmRoR!"
            redirect_to @user
            # else
            #     flash[:warning] = "Your account will be activated by the administrator soon"
            #     redirect_to root_url # equivalent to redirect_to user_url(@user)
            # end
        else
            render 'new'
        end
    end

    def update
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end


# ========================================================================================== #

    private

# permit only the 4 attributes
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :team_id)
    end

# Before filters

# set the user according to id
    def set_user
        @user = User.find(params[:id])
    end


# Confirms the correct user.
    def correct_user
        @user = User.find(params[:id])
        redirect_to root_url unless current_user?(@user)
    end

end
