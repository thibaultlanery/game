class Event < ApplicationRecord
  belongs_to :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  has_many :event_type_pickeds, dependent: :destroy
  has_many :event_types, through: :event_type_pickeds, dependent: :destroy

  validates :event_type_pickeds, presence: true
  validates :happen_at, presence: true
  validates :address, presence: true
  validates :user, presence: true
  validates :participant_number, presence: true

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

  # def event_type_name
  #   event_type.try(:name)
  # end

  # def event_type_name=(name)
  #   self.event_type = EventType.find_or_create_by(name: name.capitalize) if name.present?
  # end

# scope :include_address, -> (location) { where("address like ?", "%#{@location}%" )}
scope :event_date, -> (formated_date) { where(happen_at: formated_date )}
# scope :game_name, -> (game) { where(event_type.name == game )}
# scope :exclude_user, -> (current_user) { where(user: != current_user )}
end
