class CreateLounges < ActiveRecord::Migration[5.2]
  def change
    create_table :lounges do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.boolean :is_legacy, default: false
      t.integer :capacity
      t.integer :feed_id

      t.timestamps
    end
  end
end
