class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :login, :index, :show]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end



  # POST /users
  def create
    user = User.create(username: params[:username], password: params[:password])
    
    if user.valid?
      session[:user_id] = user.id
      render json: user
    else
      render json: { message: user.errors.full_messages }, status: :bad_request
    end
  end

  # POST for Login Check
  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      render json: user
    else
      render json: { message: "Invalid Username or Password!" }, status: :unauthorized
    end

  end

  # Persists USER LOGIN
  def autologin
      render json: @current_user # Sends back Current User
  end

  # Logs out the Current User
  def logout
    session.delete(:user_id)

    render json: { message: "Logged Out!"}
  end

  # Updates the User Profile
  def profile
      @current_user.update(username: params[:username], password: params[:password])
      render json: @current_user
  end

  # DELETE /users/1
  def destroy
    player = Player.find_by(id: @current_user.id)
    @current_user.destroy
    player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest)
    end
end
