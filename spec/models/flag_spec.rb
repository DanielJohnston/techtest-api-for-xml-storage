require 'rails_helper'

RSpec.describe Flag, type: :model do
  it { should belong_to(:property) }
  it { should validate_presence_of(:title) }
end
