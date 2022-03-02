# frozen_string_literal: true

module Coordinatable
  extend ActiveSupport::Concern

  included do
    def angle_from_coordinate(origin_latitude:, origin_longitude:, destination_latitude:, destination_longitude:)
      dLon = (destination_longitude - origin_longitude)

      y = Math.sin(dLon) * Math.cos(destination_latitude)
      x = Math.cos(origin_latitude) * Math.sin(destination_latitude) - Math.sin(origin_latitude) * Math.cos(destination_latitude) * Math.cos(dLon)

      brng = Math.atan2(y, x)

      brng *= (180 / Math::PI)
      brng = (brng + 360) % 360
      360 - brng # count degrees clockwise - remove to make counter-clockwise
    end
  end
end
