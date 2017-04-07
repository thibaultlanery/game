class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  enum status: { pending: 0, confirmed: 1, declined: 2 }
end
