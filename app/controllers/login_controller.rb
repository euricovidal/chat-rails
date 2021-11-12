class LoginController < ApplicationController
  layout 'login'

  def index
  end

  def create
    user = User.find_or_create_by!(login_params)
    user.set_online!
    session[:user] = user
    cookies[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.delete(:user)
    cookies.delete(:user_id)
    redirect_to action: :index
  end

  private

  def login_params
    params.require(:login).permit(:name)
  end
end
