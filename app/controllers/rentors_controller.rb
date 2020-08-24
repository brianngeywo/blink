class RentorsController < ApplicationController
  before_action :set_potential_rentor, only: [:completed, :show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_admin, only: [:index, :edit, :update, :destroy]
  before_action :search_ready
  before_action :get_browser

  # GET /rentors
  # GET /rentors.json
  def index
      @rentors = Rentor.all
  end

  # GET /rentors/1
  # GET /rentors/1.json
  def show
  end

  # GET /rentors/new
  def new
    @rentor = Rentor.new
  end

  # GET /rentors/1/edit
  def edit
  end

  # POST /rentors
  # POST /rentors.json
  def create
    @rentor = Rentor.new({
      rental_id: params[:rental_id],
      user_id: current_user.id
    })
    respond_to do |format|
      if @rentor.save
        format.html { redirect_to @rentor, notice: 'we have recieved your booking application, please be patient while we work on your order. feel free to browse more rentals' }
        format.json { render :show, status: :created, location: @rentor }
      else
        format.html { render :new }
        format.json { render json: @rentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentors/1
  # PATCH/PUT /rentors/1.json
  def update
    respond_to do |format|
      if @rentor.update(rentor_params)
        format.html { redirect_to @rentor, notice: 'rentor was successfully updated.' }
        format.json { render :show, status: :ok, location: @rentor }
      else
        format.html { render :edit }
        format.json { render json: @rentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentors/1
  # DELETE /rentors/1.json
  def destroy
    @rentor.destroy
    respond_to do |format|
      format.html { redirect_to potential_buyers_url, notice: 'rentor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def completed
    @rentor.status = 1
    @rentor.save
    flash[:success] = "#{User.find(@rentor.user_id).username} is now marked as completed"
    redirect_to current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_potential_rentor
    @rentor = Rentor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rentor_params
    params.fetch(:rental_id, {})
    params.require(:rentor).permit(:user_id, :rental_id)
  end

end