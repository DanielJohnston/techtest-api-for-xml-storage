class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text :url
      t.datetime :modified
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
