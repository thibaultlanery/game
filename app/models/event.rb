class Event < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :happen_at, presence: true
  validates :due_at, presence: true

geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
