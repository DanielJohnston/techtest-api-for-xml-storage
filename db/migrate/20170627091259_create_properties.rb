class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :property_id
      t.integer :branch_id
      t.text :client_name
      t.text :branch_name
      t.text :department
      t.integer :reference_number

      t.timestamps
    end
  end
end
