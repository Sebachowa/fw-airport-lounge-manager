class ChangeDateType < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date, :bdate
    add_column :bookings, :date_time, :string
  end
end
