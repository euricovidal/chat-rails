class LoginController < ApplicationController
  layout 'login'

  def index
  end

  def create
    user = User.find_or_create_by!(login_params)
    session[:user] = user
    redirect_to root_path
  end

  def destroy
    session.delete(:user)
    redirect_to action: :index
  end

  private

  def login_params
    params.require(:login).permit(:name)
  end
end
