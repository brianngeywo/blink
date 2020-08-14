class EstatesController < ApplicationController
  before_action :set_estate, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:new, :edit, :update, :destroy]
  before_action :search_ready


  def index
    @estates = Estate.all
  end

  def new
    @estate = Estate.new
  end

  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      flash[:success] = "estate successfully created"
      redirect_to @estate
    else
      flash[:error] = "estate not create"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @estate.update(estate_params)
      flash[:success] = "estate was successfully updated"
      redirect_to @estate
    else
      flash[:error] = "estate not updated"
      render "edit"
    end
  end

  def destroy
    if @estate.destroy
      flash[:success] = "Estate was successfully deleted."
      redirect_to estates_url
    else
      flash[:error] = "estate not deleted"
      redirect_to estates_url
    end
  end

  private

  def set_estate
    @estate = Estate.find(params[:id])
  end

  def estate_params
    params.require(:estate).permit(:name, :town_id)
  end
end
