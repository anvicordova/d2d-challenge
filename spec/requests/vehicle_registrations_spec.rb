# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/vehicles', type: :request do
  let(:valid_attributes) do
    { id: 'valid' }
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

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new VehicleRegistration' do
        expect do
          post vehicles_url,
               params: { vehicle: valid_attributes }, headers: valid_headers, as: :json
        end.to change(VehicleRegistration, :count).by(1)
      end

      it 'renders a JSON response with the new vehicle' do
        post vehicles_url,
             params: { vehicle: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new VehicleRegistrationRegistration' do
        expect do
          post vehicles_url,
               params: { vehicle: invalid_attributes }, as: :json
        end.to change(VehicleRegistration, :count).by(0)
      end

      it 'renders a JSON response with errors for the new vehicle' do
        post vehicles_url,
             params: { vehicle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested vehicle' do
      vehicle = VehicleRegistration.create!({ uuid: 'valid' })
      expect do
        delete vehicle_url(vehicle), headers: valid_headers, as: :json
      end.to change(VehicleRegistration, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
