class Owner < ApplicationRecord
  has_many :dogs

  validates :owner_name, presence: true
  validates :owner_address, presence: true
  validates :owner_city, presence: true
  validates :owner_province, presence: true
  validates :owner_postal_code, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj) { obj.full_address.present? && (obj.latitude.nil? || obj.longitude.nil?) }

  def full_address
    [owner_address, owner_city, owner_province, owner_postal_code, "Canada"].compact.join(', ')
  end
end
