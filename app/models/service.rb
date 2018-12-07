class Service < ApplicationRecord
  has_many :lounge_services
  has_many :lounges, :through => :lounge_services
end
