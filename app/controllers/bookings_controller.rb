class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:new]
  before_action :require_admin, only: [:edit, :update, :destory]
  before_action :search_ready

  def index
    @bookings = Booking.where(status.nil?)
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
      if logged_in?
        redirect_to @booking
      else
        render 'new'
      end
    else
      flash[:error] = "please fill all fields"
      render 'new'
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
  def unverify
    @booking = Booking.find(params[:id])
    @booking.status = nil
    @booking.save
    flash[:success] = "#{@booking.name} is still unverified"
    redirect_to bookings_url
  end

  def verify
    @booking = Booking.find(params[:id])
    @booking.status = 1
    @booking.save
    flash[:success] = "#{@booking.name} has been verified"
    redirect_to bookings_url
  end

  def complete
    @booking = Booking.find(params[:id])
    @booking.status = 2
    @booking.save
    flash[:success] = "#{@booking.name} has been completed"
    redirect_to bookings_url
  end
  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :phone_number, :town_id, :location, :rooms, :rent, :infor, :car)
  end
end
