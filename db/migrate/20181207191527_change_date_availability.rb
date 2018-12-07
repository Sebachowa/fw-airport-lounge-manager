class ChangeDateAvailability < ActiveRecord::Migration[5.2]
  def change
    remove_column :availabilities, :date, :date
    add_column :availabilities, :date_time, :string
  end
end
