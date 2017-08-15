class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
            if @user.save
                log_in @user
                flash[:success] = "Welcome to EfdmRoR!"
                redirect_to @user # equivalent to redirect_to user_url(@user)
            else
                render 'new'
            end
    end

    private

# permit only the 4 attributes
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
