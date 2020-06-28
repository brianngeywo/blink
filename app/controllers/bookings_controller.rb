class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:index, :destory]
  before_action :require_admin, only: [:index, :destory]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "we have recieved your booking, we'll communicate shortly"
      redirect_to root_path
    else
      flash[:error] = "please fill all fields"
      redirect_to new_booking_path
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      flash[:success] = "your booking has been sent, we'll call you as soon as we find a house that matches"
      redirect_to @booking
    else
      flash[:error] = "please fill all fields"
      render "edit"
    end
  end

  def destroy
    if @booking.destroy
      flash[:success] = "your booking was successfully cancelled"
      redirect_to rentals_url
    else
      flash[:error] = "Something went wrong with your cancellation request, try again"
      redirect_to @booking
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :phone, :town_id, :location, :rooms, :rent, :infor, :user_id)
  end
end