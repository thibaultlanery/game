class Event < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :game, presence: true
  validates :happen_at, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :user, presence: true

geocoded_by :address
  after_validation :geocode, if: :address_changed?

def self.include_address(location)
  Event.near(location, 50)
end


# scope :include_address, -> (location) { where("address like ?", "%#{@location}%" )}
scope :event_date, -> (formated_date) { where(happen_at: formated_date )}
scope :game_name, -> (game) { where(game: game )}

end
