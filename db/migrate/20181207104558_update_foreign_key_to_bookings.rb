class UpdateForeignKeyToBookings < ActiveRecord::Migration[5.2]
   def change
    remove_foreign_key :bookings, :lounges
    add_foreign_key :bookings, :lounges, on_delete: :cascade
  end
end