class TimeZonesController < ApplicationController
  def index
    time_zones = user.time_zones
    time_zones = time_zones.by_name(params[:name]) if params[:name]

    render json: time_zones
  end

  def show
    time_zone = user.time_zones.find(params[:id])

    render json: time_zone
  end

  def create
    time_zone = user.time_zones.new(time_zone_params)

    if time_zone.save
      render json: time_zone, status: :created
    else
      render json: time_zone.errors, status: :unprocessable_entity
    end
  end

  def update
    time_zone = user.time_zones.find(params[:id])

    if time_zone.update(time_zone_params)
      render json: time_zone
    else
      render json: time_zone.errors, status: :unprocessable_entity
    end
  end

  def destroy
    time_zone = user.time_zones.find(params[:id])

    time_zone.destroy
  end

  private

  def user
    @user ||= if params[:user_id] && current_user.admin?
      User.find(params[:user_id])
    else
      current_user
    end
  end

  def time_zone_params
    params.require(:time_zone).permit(:name, :key)
  end
end
