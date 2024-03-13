class Owner < ApplicationRecord
  has_many :dogs

  validates :owner_city, :owner_province, length: { minimum: 2, too_short: "must have at least 2 characters" }, allow_blank: true
  validates :owner_postal_code, format: { with: /\A[0-9A-Za-z-]+\z/, message: "invalid format" }, allow_blank: true
end
