class Dog < ApplicationRecord
  belongs_to :breed
  belongs_to :owner,optional:true

  validates :dog_age, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 20 }, allow_nil: true
  validates :fav_food, length: { minimum: 2 }, allow_blank: true
end
