class UsersController < ApplicationController
    def create
        @user= User.new(user_params)
        @user.save
        render json:@user
    end
    def index
        @users = User.all
        render json:@users
    end

    def update
        
    end

    def show
        @user = User.find(params[:id])
        render json:@user
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :age, :img)
    end
end
