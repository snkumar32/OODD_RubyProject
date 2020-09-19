class Payment < ApplicationRecord
  validates_length_of :cnumber, :is => 16
  validates_length_of :expMonth, :is => 2
  validates_length_of :expYr, :is => 2
  validates_length_of :cvv, :is => 3
  validates :studentid, uniqueness: true
end
