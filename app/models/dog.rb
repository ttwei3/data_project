class Dog < ApplicationRecord
  belongs_to :breed
  belongs_to :owner

  validates :dog_name, presence: true
  validates :dog_gender, presence: true
  validates :breed_id, presence: true
end
