class CreateExternalLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :external_links do |t|
      t.datetime :modified
      t.text :url
      t.text :description
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
