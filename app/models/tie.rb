class Tie < ApplicationRecord
  belongs_to :user

  # active storage: cette ligne permettra de faire @cocktail.photo...
  has_one_attached :picture

  # validations
  validates :description, presence: true
  validates :picture, presence: true
  validates :price_per_day, presence: true
  validates :name, presence: :true

  # associations

end
