class AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def show
    # byebug
    if request.headers['Authorization']
      @encoded_token = request.headers['Authorization'].split(' ')[1]
      @token = JWT.decode(@encoded_token, 'secret')
      @user_id = @token[0]['user_id']
      @user = User.find(@user_id)
      render json: { user: @user, jwt: @encoded_token }
    end
  end

  def create
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
      @token = JWT.encode({user_id: @user.id}, 'secret')
      render json: { user: @user, jwt: @token }, status: :accepted
    else
      render json: {
        errors: 'your username or password are incorrect'
      }, status: :unauthorized
    end

  end

  private

  def login_params
    params.require(:auth).permit(:username, :password)
  end

end
