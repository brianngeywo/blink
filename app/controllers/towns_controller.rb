class TownsController < ApplicationController
  before_action :set_town, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:new, :edit, :update, :destroy]

  def index
    @towns = Town.all
  end

  def new
    @town = Town.new
  end

  def update
    if @town.update(town_params)
      flash[:success] = "Town was successfully updated"
      redirect_to @town
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def show
  end

  def create
    @town = Town.new(town_params)
    if @town.save
      flash[:success] = "Town successfully created"
      redirect_to @town
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    if @town.update(town_params)
      flash[:success] = "Town was successfully updated"
      redirect_to @town
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @town.destroy
      flash[:success] = "town was successfully deleted."
      redirect_to towns_url
    else
      flash[:error] = "Something went wrong"
      redirect_to towns_url
    end
  end

  private

  def set_town
    @town = Town.find(params[:id])
  end

  def town_params
    params.require(:town).permit(:name)
  end

end
