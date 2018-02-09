class CategoryPreference < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :category_id, uniqueness: true, on: :create
end
