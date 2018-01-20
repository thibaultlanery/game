class Event < ApplicationRecord
  belongs_to :user
  belongs_to :event_type



  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :event_type, presence: true
  validates :happen_at, presence: true
  validates :address, presence: true
  validates :user, presence: true

geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attachments :photos, maximum:4

  def self.include_address(location)
    Event.near(location, 100)
  end

  def self.exclude_user(user)
    Event.where.not(user: user)
  end

def self.game_name(game)
  game = EventType.where(name: game)
  Event.where(event_type: game)
end


# scope :include_address, -> (location) { where("address like ?", "%#{@location}%" )}
scope :event_date, -> (formated_date) { where(happen_at: formated_date )}
# scope :game_name, -> (game) { where(event_type.name == game )}
# scope :exclude_user, -> (current_user) { where(user: != current_user )}
end
