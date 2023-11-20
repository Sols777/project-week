class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :venue

  validates :date, presence: true
end
