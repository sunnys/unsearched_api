class Api::V1::AuthenticationController < Api::V1::BaseController
  def create
    if user.valid_password? params[:password]
      render json: { token: user.fetch_auth_token! }, status: :ok
    else
      render json: {}, status: :unauthorized
    end
  end

  private

  def user 
    @user ||= User.find_by_email params[:email]
  end
end