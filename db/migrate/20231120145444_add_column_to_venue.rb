class AddColumnToVenue < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :bustability, :integer
  end
end
