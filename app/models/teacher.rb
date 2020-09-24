class Teacher < ApplicationRecord
  validates :name, :presence => true
  validates :email, :presence => true
  validates :address, :presence => true
  validates :discipline, :presence => true
  validates :phone, :presence => true, uniqueness: true
  validates_length_of :phone, :is => 10
end
