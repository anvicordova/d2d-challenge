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
    build(:location).attributes
  end

  let(:valid_headers) do
    {}
  end

  describe 'POST /location' do
    context 'with valid parameters' do
      it 'creates a new location for vehicle' do
        vehicle = VehicleRegistration.create! valid_attributes
        expect do
          post vehicle_locations_url(vehicle),
               params: { location: locations_valid_attributes }, headers: valid_headers, as: :json
        end.to change(Location, :count).by(1)
        expect(response).to have_http_status(:no_content)
      end

      it 'broadcasts the locations to subscribers' do
        vehicle = VehicleRegistration.create! valid_attributes

        expected_broadcast_attributes = locations_valid_attributes.merge({ vehicle_registration_id: vehicle.id }).compact.as_json
        expect do
          post vehicle_locations_url(vehicle),
               params: { location: locations_valid_attributes }, headers: valid_headers, as: :json
        end.to have_broadcasted_to('vehicle_location_channel').with(content: expected_broadcast_attributes)
      end
    end
  end
end
