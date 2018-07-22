class EventTypePicked < ApplicationRecord
  belongs_to :event_type
  belongs_to :event
end
