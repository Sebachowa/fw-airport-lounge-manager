class Service < ApplicationRecord
  has_many :lounge_services
  has_many :booking_services
  has_many :lounges, :through => :lounge_services
  has_many :bookings, :through => :booking_services
end
