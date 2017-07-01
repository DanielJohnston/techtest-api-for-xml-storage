class CreateFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :flags do |t|
      t.text :title
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
