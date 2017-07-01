require 'rails_helper'

RSpec.describe Image, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:property) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:url) }
end
