class AddDescriptionToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :main_summary, :text
    add_column :properties, :full_description, :text
  end
end
