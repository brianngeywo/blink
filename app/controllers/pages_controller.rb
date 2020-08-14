class PagesController < ApplicationController
  before_action :search_ready

  def contact
  end

  def home
    redirect_to rentals_path if logged_in?
  end

  def listing
  end

  def finder
  end
end
