class CreateBrochures < ActiveRecord::Migration[5.1]
  def change
    create_table :brochures do |t|
      t.datetime :modified
      t.text :url
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
