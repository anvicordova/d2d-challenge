# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleRegistration, type: :model do
  context 'validates uuuid uniqueness' do
    let(:uuid) { '12345678-1234-1234-1234-123456789012' }

    context 'when the vehicle has been registered and deregistered before' do
      before do
        vehicle_registration = create(:vehicle_registration, uuid:)
        vehicle_registration.destroy
      end

      it 'creates a new VehicleRegistration' do
        expect do
          create(:vehicle_registration, uuid:)
        end.to change(VehicleRegistration, :count).by(1)
      end
    end

    context 'when the vehicle has been registered before' do
      before do
        create(:vehicle_registration, uuid:)
      end

      it 'does not create a new VehicleRegistration' do
        expect do
          create(:vehicle_registration, uuid:)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
