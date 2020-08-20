class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update]
  before_action :search_ready

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

  def make_admin
    @user = User.find(params[:id])
    @user.admin = true
    @user.save
    flash[:success] = "#{@user.username} is now an Admin"
    redirect_to users_url
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.admin = false
    @user.save
    flash[:success] = "#{@user.username} is no longer an Admin"
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :cover_photo, :profile_picture, :location, :phone_number, :email, town_ids: [])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "you must be the owner to perform that action"
      redirect_to root_path
    end
  end
end
