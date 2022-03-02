# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    latitude { '52.53' }
    longitude { '13.403' }
    sent_at { DateTime.now.utc.iso8601 }
    vehicle_registration
  end
end
