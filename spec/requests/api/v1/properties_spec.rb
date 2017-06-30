require 'rails_helper'

RSpec.describe "Properties", type: :request do
  describe "POST /api/v1/properties" do
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

    it 'rejects a request with neither properties nor property tag' do
      payload = IO.read('./spec/requests/api/v1/sample_no_properties_or_property.xml')
      post "/api/v1/properties", params: payload, headers: { 'CONTENT_TYPE' => 'application/xml' }
      expect(response).to have_http_status(422)
    end
  end
end
