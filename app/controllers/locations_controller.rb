# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_vehicle, only: %i[create]

  def create
    @location = Location.new(location_params)
    @location.vehicle_registration = @vehicle

    if @location.save
      broadcast_location if @location.valid_location?
      render json: {}, status: :no_content
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  def broadcast_location
    ActionCable.server.broadcast('vehicle_location_channel', { content:  @location.broadcast_attributes })
  end

  def location_params
    params.require(:location).permit(:vehicle_id, :latitude, :longitude, :sent_at)
  end

  def set_vehicle
    @vehicle = VehicleRegistration.find(params[:vehicle_id])
  end
end
