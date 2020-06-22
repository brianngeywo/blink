class SessionsController < ApplicationController
  def new
    redirect_to rentals_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "welcome to furaha rentals"
      redirect_to user_path(user)
    else
      flash[:error] = "incorrect credentials"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
end
