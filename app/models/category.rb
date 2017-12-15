class Category < ApplicationRecord
  has_many :events
  belongs_to :category_preferences
  has_many :users, through: :category_preferences, dependent: :destroy
end
