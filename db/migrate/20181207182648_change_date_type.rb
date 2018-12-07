class ChangeDateType < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date, :date
    add_column :bookings, :date_time, :string
  end
end
