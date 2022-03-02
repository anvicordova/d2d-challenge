# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'validates if the location is not valid' do
    location = Location.new(latitude: '-23.55', longitude: '-46.6')
    expect(location.in_city_boundaries?).to be false
  end

  it 'validates if the location is not valid' do
    location = Location.new(latitude: '52.53', longitude: '13.403')
    expect(location.in_city_boundaries?).to be true
  end

  it 'sets a bearing angle' do
    vehicle = build(:vehicle_registration)
    Location.create!(latitude: '52.53', longitude: '13.403', vehicle_registration: vehicle)
    location = Location.create!(latitude: '52.53', longitude: '13.403', vehicle_registration: vehicle)
    expect(location.bearing_angle).to eq(360)
  end
end
