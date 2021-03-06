class Tie < ApplicationRecord
  belongs_to :user

  # active storage: cette ligne permettra de faire @cocktail.photo...
  has_one_attached :picture

  has_many :bookings, dependent: :destroy

  # validations
  validates :description, presence: true
  validates :picture, presence: true
  validates :price_per_day, presence: true
  validates :name, presence: true

  # geocode
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
