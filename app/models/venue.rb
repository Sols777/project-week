class Venue < ApplicationRecord
  belongs_to :users
  has_many :bookings
end
