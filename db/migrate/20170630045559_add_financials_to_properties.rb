class AddFinancialsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :price, :decimal
    add_column :properties, :for_sale_poa, :decimal
    add_column :properties, :price_qualifier, :integer
    add_column :properties, :property_tenure, :integer
    add_column :properties, :sale_by, :boolean
    add_column :properties, :development_opportunity, :boolean
    add_column :properties, :investment_opportunity, :boolean
    add_column :properties, :estimated_rental_income, :decimal
    add_column :properties, :availability, :integer
  end
end
