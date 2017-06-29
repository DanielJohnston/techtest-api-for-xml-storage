require 'rails_helper'

RSpec.describe "Properties", type: :request do
  describe "POST /api/v1/properties" do
    it "accepts a request constructed as a single property record" do
      # Single record highest level is <property>, not <properties>
      payload = IO.read('./spec/requests/api/v1/sample_property.xml')
      post "/api/v1/properties", params: payload, headers: { 'CONTENT_TYPE' => 'application/xml' }
      expect(response).to be_success
      # get properties_path
      # expect(response).to have_http_status(200)
    end
  end
end
