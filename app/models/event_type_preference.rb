class EventTypePreference < ApplicationRecord
  belongs_to :event_type
  belongs_to :user
  # validates :event_type_id, uniqueness: true, on: :create
  has_many :users, through: :event_type_preferences

    def event_type_name
    event_type.try(:name)
  end

  def event_type_name=(name)
    self.event_type = EventType.find_or_create_by(name: name) if name.present?
  end
end
