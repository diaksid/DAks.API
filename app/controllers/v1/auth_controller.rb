class V1::AuthController < V1::ApplicationController
  before_action :authenticate, only: [:logout, :user]

  def login
    @user = User.find_for_database_authentication email: login_params[:email]
    if @user&.valid_password? login_params[:password]
      render json: {token: @user.access_token}
    else
      render json: {token: false}, status: :not_found
    end
  end


  def logout
    render json: {status: !!@user}, status: (@user.nil? ? 404 : 200)
  end


  def user
    render json: {user: @user}, status: (@user.nil? ? 404 : 200)
  end


  private


  def login_params
    params.require(:auth).permit(:email, :password)
  end
end
