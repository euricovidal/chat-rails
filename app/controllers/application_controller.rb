class ApplicationController < ActionController::Base
  include ForgeryProtection
  include SetPlatform

  helper_method :current_user

  private

  def current_user
    User.new(session[:user])
  end

  def authenticate_user!
    return if session[:user].present?

    redirect_to login_path
  end
end
