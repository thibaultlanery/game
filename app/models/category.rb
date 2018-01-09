class Category < ApplicationRecord
  has_many :events, through: :event_types, dependent: :destroy
  belongs_to :category_preference
  has_many :users, through: :category_preferences, dependent: :destroy
end
