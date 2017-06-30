class AddModifiedDateToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :date_last_modified, :date
  end
end
