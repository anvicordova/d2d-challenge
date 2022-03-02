# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    latitude { '9.99' }
    longitude { '9.99' }
    sent_at { DateTime.now.utc.iso8601 }
    vehicle_registration
  end
end
