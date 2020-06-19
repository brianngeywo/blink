class EstatesController < ApplicationController
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
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
    @estate = Estate.find(params[:id])
  end

  def edit
    @estate = Estate.find(params[:id])
  end

  def update
    @estate = Estate.find(params[:id])
    if @estate.update(estate_params)
      flash[:success] = "Object was successfully updated"
      redirect_to @estate
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    @estate = Estate.find(params[:id])
    if @estate.destroy
      flash[:success] = "Estate was successfully deleted."
      redirect_to estates_url
    else
      flash[:error] = "Something went wrong"
      redirect_to estates_url
    end
  end

  private

  def estate_params
    params.require(:estate).permit(:name, :town_id)
  end
end
