class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.references :lounge, foreign_key: true
      t.date :date
      t.integer :remaining, default: 0
      t.timestamps
    end
  end
end
