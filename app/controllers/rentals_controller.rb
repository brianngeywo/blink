class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
    @q = Rental.ransack(params[:q])
    @rentals = @q.result(distinct: true)
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = User.first
    if @rental.save
      flash[:success] = "rental successfully created"
      redirect_to @rental
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    if @rental.update(rental_params)
      flash[:success] = "rental was successfully updated"
      redirect_to @rental
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end
def destroy
  @rental = Rental.find(params[:id])
  if @rental.destroy
    flash[:success] = 'Rental was successfully deleted.'
    redirect_to rentals_url
  else
    flash[:error] = 'Something went wrong'
    redirect_to rentals_url
  end
end

  private

  def rental_params
    params.require(:rental).permit(:name, :units, :bedrooms, :contacts, :price, :town_id, :estate_id, :photo)
  end
end
