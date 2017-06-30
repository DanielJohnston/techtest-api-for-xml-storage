class AddAddressFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :address_name, :text
    add_column :properties, :address_number, :text
    add_column :properties, :address_street, :text
    add_column :properties, :address2, :text
    add_column :properties, :address3, :text
    add_column :properties, :address4, :text
    add_column :properties, :address_postcode, :text
    add_column :properties, :country, :text
    add_column :properties, :display_address, :text
  end
end
