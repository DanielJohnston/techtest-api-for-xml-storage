class Flag < ApplicationRecord
  belongs_to :property

  validates_presence_of :title, :property
end
