class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # has_many :users, through: :bookings, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model

  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :capacity, presence: true
  validates :capacity, numericality: {only_integer: true, greater_than: 50 }
  validates :bustability, presence: true, inclusion: 1..100

  pg_search_scope :search_venues,
  against: [ :name, :address, :capacity],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
