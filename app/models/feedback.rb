class Feedback < ApplicationRecord
  validates :ftext, :presence => true
end
