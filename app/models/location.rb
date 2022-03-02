# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id                      :bigint           not null, primary key
#  latitude                :decimal(, )
#  longitude               :decimal(, )
#  sent_at                 :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  vehicle_registration_id :integer
#
class Location < ApplicationRecord
  include Coordinatable

  before_create :bearing_calculation

  belongs_to :vehicle_registration

  def in_city_boundaries?
    Geocoder.configure(units: :km)
    distance_in_km = Geocoder::Calculations.distance_between([ENV['DEFAULT_LATITUDE'], ENV['DEFAULT_LONGITUDE']],
                                                             [latitude, longitude])
    distance_in_km < ENV['MAX_DISTANCE_IN_KM'].to_f
  end

  def broadcast_attributes
    {
      latitude:,
      longitude:,
      vehicle_registration_id:,
      sent_at:
    }
  end

  def bearing_calculation
    last_location = Location.where(vehicle_registration_id:).last
    if last_location
      self.bearing_angle = angle_from_coordinate(
        origin_latitude: last_location.latitude,
        origin_longitude: last_location.longitude,
        destination_latitude: latitude,
        destination_longitude: longitude
      )
    end
  end
end
