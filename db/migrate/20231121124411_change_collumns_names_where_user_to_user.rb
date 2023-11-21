class ChangeCollumnsNamesWhereUserToUser < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :users_id, :user_id
    rename_column :venues, :users_id, :user_id
  end
end
