class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :status, inclusion: { in: %w[accepted pending rejected] }
end
