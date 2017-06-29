require 'rails_helper'

RSpec.describe "Properties", type: :request do
  describe "POST /api/v1/properties" do
    it "accepts a request constructed as a single property record" do
      # Single record highest level is <property>, not <properties>
      payload = IO.read('./spec/requests/api/v1/sample_property.xml')
      post "/api/v1/properties", params: payload, headers: { 'CONTENT_TYPE' => 'application/xml' }
      expect(response).to be_success
    end

    it 'accepts a request with a single property inside a properties tag' do
      payload = IO.read('./spec/requests/api/v1/sample_properties.xml')
      post "/api/v1/properties", params: payload, headers: { 'CONTENT_TYPE' => 'application/xml' }
      expect(response).to be_success
    end

    it 'accepts a request with two identical properties inside a properties tag' do
      payload = IO.read('./spec/requests/api/v1/sample_multiple_properties.xml')
      post "/api/v1/properties", params: payload, headers: { 'CONTENT_TYPE' => 'application/xml' }
      expect(response).to be_success
    end
  end
end
