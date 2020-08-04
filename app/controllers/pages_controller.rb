class PagesController < ApplicationController
  def contact
  end

  def home
    redirect_to rentals_path if logged_in?
    @rentals = Rental.all
    @q = Rental.ransack(params[:q])
    @rentals = @q.result(distinct: true)
  end

  def listing
  end

  def finder
  end
end
