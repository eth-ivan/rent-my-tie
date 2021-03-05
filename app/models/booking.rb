class Booking < ApplicationRecord
  belongs_to :user, :tie
end
