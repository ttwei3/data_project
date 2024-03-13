class Breed < ApplicationRecord
  has_many :dogs

  validates :breed_name, presence: true, uniqueness: true
end
