class V1::ApplicationController < ActionController::API
  respond_to :json


  private


  def authenticate
    token = request.authorization.split(' ', 2).last || ''
    @user = token.empty? ? nil : User.select(:id, :email, :name).find_by(access_token: token)
  end


  def authenticate_staff
    authenticate
    @user&.staff?
  end
end
