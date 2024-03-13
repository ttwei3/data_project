class Owner < ApplicationRecord
  has_many :dogs

  validates :owner_name, presence: true
  validates :owner_address, presence: true
  validates :owner_city, presence: true
  validates :owner_province, presence: true
  validates :owner_postal_code, presence: true
end
