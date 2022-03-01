# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show update destroy]
  before_action :location_vehicle, only: %i[location]

  # GET /vehicles
  def index
    @vehicles = Vehicle.all

    render json: @vehicles
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render json: {}, status: :no_content
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
    render json: {}, status: :no_content
  end

  def location
    @location = Location.new(location_params)
    @location.vehicle = @vehicle

    if @location.save
      render json: {}, status: :no_content
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  def location_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:vehicle_id, :latitude, :longitude, :sent_at)
  end

  # Only allow a list of trusted parameters through.
  def vehicle_params
    params.require(:vehicle).permit(:uuid)
  end
end
