class Event < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations


geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
