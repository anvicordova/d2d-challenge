# frozen_string_literal: true

class VehicleLocationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'vehicle_location_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
