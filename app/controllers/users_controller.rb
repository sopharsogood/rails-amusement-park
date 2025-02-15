class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])
    end

    def signin
        @user = User.new
    end

    def login
        @user = User.find_by(name: params[:user_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :signin
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def redirect_if_not_logged_in
        if !session[:user_id]
            redirect_to root_path
        end
    end
end
