class AddGeographyToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :featured_property, :boolean
    add_column :properties, :region_id, :integer
    add_column :properties, :latitude, :decimal
    add_column :properties, :longitude, :decimal
  end
end
