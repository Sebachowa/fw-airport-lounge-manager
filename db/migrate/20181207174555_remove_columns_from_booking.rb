class RemoveColumnsFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :is_with_metting_room, :boolean
    remove_column :bookings, :is_with_gim, :boolean
    remove_column :bookings, :is_with_spa, :boolean
  end
end
