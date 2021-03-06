# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehiclesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/vehicles').to route_to('vehicles#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/vehicles/1').to route_to('vehicles#destroy', id: '1')
    end
  end
end
