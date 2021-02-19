class AttractionsController < ApplicationController

  before_action :require_login

  def index
    @attractions = Attraction.all
  end

  def show
    find_attraction
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:success] = "Attraction created"
      redirect_to attraction_path(@attraction.id)
    else
      flash[:error] = "Error. Attraction not created"
      render :new
    end
  end

  def edit
    find_attraction
  end

  def update
    find_attraction
    if @attraction.update(attraction_params)
      flash[:success] = "Attraction updated"
      redirect_to attraction_path(@attraction.id)
    else
      flash[:error] = "Error. Attraction not created"
      render :edit
    end
  end

  def destroy
    find_attraction
    @attraction.destroy
    flash[:success] = "Attraction deleted"
    redirect_to attractions_path
  end

  private

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :tickets, :happiness_rating, :min_height)
  end

end