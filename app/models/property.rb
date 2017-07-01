class Property < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :floorplans, dependent: :destroy
  has_many :epc_graphs, dependent: :destroy
  has_many :epc_front_pages, dependent: :destroy
  has_many :brochures, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :floorplans, allow_destroy: true
  accepts_nested_attributes_for :epc_graphs, allow_destroy: true
  accepts_nested_attributes_for :epc_front_pages, allow_destroy: true
  accepts_nested_attributes_for :brochures, allow_destroy: true
  validates_presence_of :property_id, :reference_number
end
