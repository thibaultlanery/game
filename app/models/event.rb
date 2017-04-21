class Event < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations


geocoded_by :address
  after_validation :geocode, if: :address_changed?

scope :include_address, -> (location) { where("address like ?", "%#{@location}%" )}
scope :event_date, -> (date) { where(happen_at: date )}
scope :game_name, -> (game) { where(game: game )}

end
