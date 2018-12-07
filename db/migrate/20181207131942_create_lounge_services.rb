class CreateLoungeServices < ActiveRecord::Migration[5.2]
  def change
    create_table :lounge_services do |t|
      t.integer :lounge_id
      t.integer :service_id
      t.timestamps
    end
  end
end
