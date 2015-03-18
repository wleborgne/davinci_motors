class Car < ActiveRecord::Base
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, numericality: true
  validates :price, allow_nil: true, numericality: true
end
