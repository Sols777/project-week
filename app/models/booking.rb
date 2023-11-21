class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :venue

  validates :date, presence: true
  validates :status, presence: true
  validates :status, inclusion: { in: %w[accepted pending rejected] }
end
