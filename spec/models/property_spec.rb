require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should have_many(:flags).dependent(:destroy) }
  it { should have_many(:images).dependent(:destroy) }
  it { should have_many(:floorplans).dependent(:destroy) }
  it { should have_many(:epc_graphs).dependent(:destroy) }
  it { should have_many(:epc_front_pages).dependent(:destroy) }
  it { should have_many(:brochures).dependent(:destroy) }
  it { should have_many(:virtual_tours).dependent(:destroy) }
  it { should have_many(:external_links).dependent(:destroy) }

  it { should validate_presence_of(:property_id) }
  it { should validate_presence_of(:reference_number) }
end
