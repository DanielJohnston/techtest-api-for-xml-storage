class AddRoomCountsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :property_bedrooms, :integer
    add_column :properties, :property_bathrooms, :integer
    add_column :properties, :property_ensuites, :integer
    add_column :properties, :property_reception_rooms, :integer
    add_column :properties, :property_kitchens, :integer
  end
end
