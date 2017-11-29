class TimeZonesController < ApplicationController
  before_action :set_time_zone, only: [:show, :update, :destroy]

  # GET /time_zones
  def index
    @time_zones = TimeZone.all

    render json: @time_zones
  end

  # GET /time_zones/1
  def show
    render json: @time_zone
  end

  # POST /time_zones
  def create
    @time_zone = TimeZone.new(time_zone_params)

    if @time_zone.save
      render json: @time_zone, status: :created, location: @time_zone
    else
      render json: @time_zone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_zones/1
  def update
    if @time_zone.update(time_zone_params)
      render json: @time_zone
    else
      render json: @time_zone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_zones/1
  def destroy
    @time_zone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_zone
      @time_zone = TimeZone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def time_zone_params
      params.require(:time_zone).permit(:name, :description, :user_id)
    end
end
