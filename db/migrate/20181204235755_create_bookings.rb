class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :lounge, foreign_key: true
      t.date :date
      t.boolean :is_with_metting_room, default: false
      t.boolean :is_with_gim, default: false
      t.boolean :is_with_spa, default: false
      t.integer :total_people, default: 1

      t.timestamps
    end
  end
end
