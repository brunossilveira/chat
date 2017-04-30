class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = user_params[:username]
    session[:dialect] = user_params[:dialect]

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :dialect)
  end
end
