class Student < ApplicationRecord
  validates :name, :presence => true
  validates :email, :presence => true, uniqueness: true
  validates :address, :presence => true
  validates :major, :presence => true
  validates :phone, :presence => true
end
