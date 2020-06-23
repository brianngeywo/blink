class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def new
    redirect_to rentals_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to salama houses"
      redirect_to @user
    else
      flash[:error] = "could not create your account"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "successfully updated your account"
      redirect_to @user
    else
      flash[:error] = "failed to update your account"
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "your account has been deleted"
      redirect_to users_url
    else
      flash[:error] = "could not close your account"
      redirect_to @user
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "you must be the owner to perform that action"
      redirect_to root_path
    end
  end
end
