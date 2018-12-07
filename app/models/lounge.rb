class Lounge < ApplicationRecord
  has_many :bookings, dependent: :delete_all
  has_many :availabilites, dependent: :delete_all
  has_many :lounge_services
  has_many :services, :through => :lounge_services
end
