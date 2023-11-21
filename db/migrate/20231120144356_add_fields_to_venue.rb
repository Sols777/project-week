class AddFieldsToVenue < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :address, :string
    add_column :venues, :name, :string
    add_column :venues, :description, :string
    add_column :venues, :capacity, :integer
    add_column :venues, :status, :boolean
    add_reference :venues, :users, foreign_key: true
  end
end
