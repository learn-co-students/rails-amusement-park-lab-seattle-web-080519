class RidesController < ApplicationController

  before_action :require_login

  def create
    @ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
    if @ride.save
      flash[:success] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
      puts @ride.errors.full_messages
      redirect_to attraction_path(@ride.attraction)
    end
end


end