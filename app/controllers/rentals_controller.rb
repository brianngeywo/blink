class RentalsController < ApplicationController
  before_action :set_user, only: [:bookings,:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:bookings, :edit, :update, :destroy]
  before_action :search_ready
  before_action :get_browser

  def index
  end

  def new
    @rental = Rental.new
    5.times do
       @rental.rental_features.build
    end
  end
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    if @rental.save
      flash[:success] = "rental successfully created"
      redirect_to @rental
    else
      flash[:error] = "rental not created"
      redirect_to new_rental_path
    end
  end

  def show
  end

  def edit
    2.times do
      @rental.rental_features.build
    end
  end

  def update
    if @rental.update!(rental_params)
      flash[:success] = "rental was successfully updated"
      redirect_to @rental
    else
      flash[:error] = "could not update rental"
      render "edit"
    end
  end

  def destroy
    if @rental.destroy
      flash[:success] = "Rental was successfully deleted."
      redirect_to rentals_url
    else
      flash[:error] = "could not delete rental"
      redirect_to rentals_url
    end
  end

  def bookings
    @rental = Rental.find(params[:id])
  end

  private

  def set_user
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:name, :units, :bedrooms, :contacts, :price, :town_id, :estate_id, :cover_image, :features, :wifi, :parking, :bathrooms ,photos: [])
  end

  def require_same_user
    if current_user != @rental.user and !current_user.admin?
      flash[:danger] = "you must be the owner to perform that action"
      redirect_to root_path
    end
  end
end
