class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @users = User.all
    if !logged_in?
      redirect_to login_path
    end
  end

  def new
    redirect_to rentals_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      flash[:success] = "Welcome to the blink rentals #{@user.username}"

      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update!(user_params)
      flash[:success] = "successfully updated your account"
      redirect_to @user
    else
      flash[:error] = "failed to update your account"
      render "edit"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :cover_photo, :profile_picture, :location, :phone, :email, town_ids: [])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "you must be the owner to perform that action"
      redirect_to root_path
    end
  end
end
