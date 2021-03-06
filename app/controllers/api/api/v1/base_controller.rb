class Api::V1::BaseController < ApplicationController
  before_action :ensure_and_set_current_user!
 
  def ensure_and_set_current_user
    if current_user
      @current_user = current_user
    else
      render json: {}, status: :unauthorized
    end
  end

  private

  def user
    User.find_by_auth_token request.env[‘HTTP_AUTHORIZATION’] 
  end
end
