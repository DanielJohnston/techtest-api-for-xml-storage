require 'rails_helper'

RSpec.describe Property, type: :model do
  # Association test
  # ensure Property model has a 1:m relationship with the Image model
  it { should have_many(:images).dependent(:destroy) }
  it { should have_many(:floorplans).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:property_id) }
  it { should validate_presence_of(:reference_number) }
end
