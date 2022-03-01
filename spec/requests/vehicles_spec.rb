require 'rails_helper'

RSpec.describe "/vehicles", type: :request do
  let(:valid_attributes) {
    build(:vehicle).attributes
  }

  let(:invalid_attributes) {
    {other: "invalid"}
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Vehicle.create! valid_attributes
    
      get vehicles_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      vehicle = Vehicle.create! valid_attributes
      get vehicle_url(vehicle), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Vehicle" do
        expect {
          post vehicles_url,
               params: { vehicle: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Vehicle, :count).by(1)
      end

      it "renders a JSON response with the new vehicle" do
        post vehicles_url,
             params: { vehicle: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:no_content)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vehicle" do
        expect {
          post vehicles_url,
               params: { vehicle: invalid_attributes }, as: :json
        }.to change(Vehicle, :count).by(0)
      end

      it "renders a JSON response with errors for the new vehicle" do
        post vehicles_url,
             params: { vehicle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested vehicle" do
      vehicle = Vehicle.create! valid_attributes
      expect {
        delete vehicle_url(vehicle), headers: valid_headers, as: :json
      }.to change(Vehicle, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
