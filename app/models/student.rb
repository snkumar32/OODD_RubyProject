class Student < ApplicationRecord
  validates :name, :presence => true
  validates :address, :presence => true
  validates :major, :presence => true
  validates :phone, :presence => true
  validates_length_of :phone, :is => 10
end
