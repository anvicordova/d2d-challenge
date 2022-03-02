# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show update destroy]

  # POST /vehicles
  def create
    @vehicle = VehicleRegistration.new(vehicle_params)

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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = VehicleRegistration.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vehicle_params
    origin_params = params.require(:vehicle).permit(:id)
    { uuid: origin_params[:id] }
  end
end
