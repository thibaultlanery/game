class EventTypePreference < ApplicationRecord
  belongs_to :event_type
  belongs_to :user
  validates :event_type_id, uniqueness: true, on: :create
  has_many :users, through: :event_type_preferences
end
