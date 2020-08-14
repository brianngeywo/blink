class CustomersController < ApplicationController
  before_action :require_admin, only: [:index]
  before_action :search_ready


  def index
    if !logged_in? && !current_user.admin
      flash[:success] = "you must be an admin to perform that action"
      redirect_to login_path
    end
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "we have recieved you details, we'll call you shortly"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def complete
    @customer = Customer.find(params[:id])
    @customer.status = 1
    @customer.save
    flash[:success] = "#{@customer.name} wants a home"
    redirect_to new_booking_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone_number)
  end
end
