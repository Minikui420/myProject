class Api::Data::UsersController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        if @user
            render json: @user
        else 
            render json: { error: 'Something error!' }, status: 400
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: { error: 'Unable to create user' }, status: 400
        end
    end

    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: { message: 'User successfully updated' }, status: 200
        else
            render json: { error: 'Unable to update user' }, status: 400
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy(user_params)
            render json: { message: 'User successfully deleted' }, status: 200
        else
            render json: { error: 'Unable to delete user' }, status: 400
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
