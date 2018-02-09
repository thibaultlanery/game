class EventType < ApplicationRecord

  belongs_to :category
  # validates :name, on: :create

end
