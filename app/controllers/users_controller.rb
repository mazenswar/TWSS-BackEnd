class UsersController < ApplicationController

    def index
      @users = User.all
      render json: @users
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = JWT.encode({user_id: @user.id}, 'secret')
       render json: { user: @user, jwt: @token }, status: :created
     else
       render json: { error: 'failed to create user' }, status: :not_acceptable
     end
    end

    private

    def user_params
      params.permit(:username, :password, :email, :bio, :profile_img)
    end
end
