class Service < ApplicationRecord
  belongs_to :lounge, optional: true
end
