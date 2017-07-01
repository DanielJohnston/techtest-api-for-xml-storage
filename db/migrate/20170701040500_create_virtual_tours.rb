class CreateVirtualTours < ActiveRecord::Migration[5.1]
  def change
    create_table :virtual_tours do |t|
      t.datetime :modified
      t.text :url
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
