class CreateBookingServices < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_services do |t|
      t.integer :booking_id
      t.integer :service_id
      t.timestamps
    end
  end
end
