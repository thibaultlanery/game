 class EventType < ApplicationRecord

  belongs_to :category
  validates :name, uniqueness: true
  has_many :events, through: :event_type_pickeds, dependent: :destroy
  has_many :event_type_preferences, dependent: :destroy
  has_many :event_type_pickeds, dependent: :destroy

end
