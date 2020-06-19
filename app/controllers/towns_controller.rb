class TownsController < ApplicationController
  def index
    @towns = Town.all
  end

  def new
    @town = Town.new
  end

  def update
    @town = Town.find(params[:id])
    if @town.update(town_params)
      flash[:success] = "Town was successfully updated"
      redirect_to @town
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def show
    @town = Town.find(params[:id])
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
    @town = Town.find(params[:id])
  end

  def update
    @town = Town.find(params[:id])
    if @town.update(town_params)
      flash[:success] = "Town was successfully updated"
      redirect_to @town
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    @town = Town.find(params[:id])
    if @town.destroy
      flash[:success] = "town was successfully deleted."
      redirect_to towns_url
    else
      flash[:error] = "Something went wrong"
      redirect_to towns_url
    end
  end

  private

  def town_params
    params.require(:town).permit(:name)
  end
end
