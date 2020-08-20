class SessionsController < ApplicationController
  def new
    redirect_to rentals_path if logged_in?
  end

  def create
    user = User.find_by(phone_number: params[:session][:phone_number])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      flash[:success] = "You have successfully logged in"

      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"

      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
end
