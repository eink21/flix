class Review < ActiveRecord::Base
  belongs_to :movie

  validates :name, presence: true
  validates :comment, length: {minimum: 4}
  STAR_VALUES = [1,2,3,4,5]
  validates :stars, inclusion: {in: STAR_VALUES, message: "must be between 1 and 5"}
end
