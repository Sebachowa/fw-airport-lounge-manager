class Lounge < ApplicationRecord
  has_many :bookings
  has_many :services
  has_many :availabilites
end
