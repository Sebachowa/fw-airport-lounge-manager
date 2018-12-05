class AddExtraServicesToLounge < ActiveRecord::Migration[5.2]
  def change
    add_reference :lounges, :services, foreign_key: true
  end
end
