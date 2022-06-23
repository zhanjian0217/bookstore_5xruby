# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include CartsHelper

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = '你沒有權限 !'
      redirect_to root_path
    end
  end
end
