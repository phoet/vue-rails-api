class TimeZonesController < ApplicationController
  def index
    time_zones = current_user.time_zones

    render json: time_zones
  end

  def show
    time_zone = current_user.find(params[:id])

    render json: time_zone
  end

  def create
    time_zone = current_user.time_zones.new(time_zone_params)

    if time_zone.save
      render json: time_zone, status: :created
    else
      render json: time_zone.errors, status: :unprocessable_entity
    end
  end

  def update
    time_zone = current_user.find(params[:id])

    if time_zone.update(time_zone_params)
      render json: time_zone
    else
      render json: time_zone.errors, status: :unprocessable_entity
    end
  end

  def destroy
    time_zone = current_user.find(params[:id])

    time_zone.destroy
  end

  private

  def time_zone_params
    params.require(:time_zone).permit(:name, :description)
  end
end
