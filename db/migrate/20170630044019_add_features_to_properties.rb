class AddFeaturesToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :display_property_type, :text
    add_column :properties, :property_type, :integer
    add_column :properties, :property_style, :integer
    add_column :properties, :property_age, :integer
    add_column :properties, :floor_area, :decimal, precision: 16, scale: 2
    add_column :properties, :floor_area_units, :text
    add_column :properties, :property_feature1, :text
    add_column :properties, :property_feature2, :text
    add_column :properties, :property_feature3, :text
    add_column :properties, :property_feature4, :text
    add_column :properties, :property_feature5, :text
    add_column :properties, :property_feature6, :text
    add_column :properties, :property_feature7, :text
    add_column :properties, :property_feature8, :text
    add_column :properties, :property_feature9, :text
    add_column :properties, :property_feature10, :text
  end
end
