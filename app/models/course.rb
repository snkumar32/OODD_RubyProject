class Course < ApplicationRecord
  validates :name, :presence => true
  validates :number, :presence => true, uniqueness: true
  validates :area, :presence => true
  validates :discipline, :presence => true
  validates :price, :presence => true
end
