# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/vehicles', type: :request do
  let(:valid_attributes) do
    build(:vehicle_registration).attributes
  end

  let(:invalid_attributes) do
    { other: 'invalid' }
  end

  let(:locations_valid_attributes) do
    {
      lat: '52.53',
      lng: '13.403',
      at: DateTime.now.utc
    }
  end

  let(:expected_broadcast_attributes) do
    {
      latitude: locations_valid_attributes.fetch(:lat),
      longitude: locations_valid_attributes.fetch(:lng),
      sent_at: locations_valid_attributes.fetch(:at)
    }
  end

  let(:locations_invalid_attributes) do
    build(:location, latitude: 9.99, longitude: 9.99).attributes
  end

  let(:valid_headers) do
    {}
  end

  describe 'POST /location' do
    context 'with valid parameters' do
      it 'creates a new location for vehicle' do
        vehicle = VehicleRegistration.create! valid_attributes
        expect do
          post vehicle_locations_url(vehicle.uuid),
               params: { location: locations_valid_attributes }, headers: valid_headers, as: :json
        end.to change(Location, :count).by(1)
        expect(response).to have_http_status(:no_content)
      end

      it 'broadcasts the locations to subscribers' do
        vehicle = VehicleRegistration.create! valid_attributes

        broadcast_attributes = expected_broadcast_attributes.merge({ vehicle_registration_id: vehicle.id }).compact.as_json
        expect do
          post vehicle_locations_url(vehicle.uuid),
               params: { location: locations_valid_attributes }, headers: valid_headers, as: :json
        end.to have_broadcasted_to('vehicle_location_channel').with(content: broadcast_attributes)
      end

      it 'does not broadcasts the locations outside range' do
        vehicle = VehicleRegistration.create! valid_attributes

        expect do
          post vehicle_locations_url(vehicle.uuid),
               params: { location: locations_invalid_attributes }, headers: valid_headers, as: :json
        end.not_to have_broadcasted_to('vehicle_location_channel')
      end
    end
  end
end
