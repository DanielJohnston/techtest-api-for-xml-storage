class EpcFrontPage < ApplicationRecord
  belongs_to :property

  validates_presence_of :url, :property
end
