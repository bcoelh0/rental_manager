class AddsHouseAndRentalIdsToUsers < ActiveRecord::Migration
  def change
    add_column :houses, :user_id, :integer
    add_column :rentals, :user_id, :integer
  end
end
