class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :category_preferences
  has_many :categories, through: :category_preferences
  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy
#test#
  has_many :events, through: :participations
#test#
  validates :gender, presence: true
  validates :age, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
