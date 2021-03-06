class Booking < ApplicationRecord
  belongs_to :tie
  belongs_to :user
end
