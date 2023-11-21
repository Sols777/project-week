class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy

  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :capacity, presence: true
  validates :capacity, numericality: {only_integer: true, greater_than: 50 }
  validates :bustability, presence: true, inclusion: 1..100
end
