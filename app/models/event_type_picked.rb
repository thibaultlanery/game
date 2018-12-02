class EventTypePicked < ApplicationRecord
  belongs_to :event_type
  belongs_to :event #, inverse_of: :event_type_pickeds
  # validates_presence_of :event
end
