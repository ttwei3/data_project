class Owner < ApplicationRecord
  has_many :dogs

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj) { obj.full_address.present? && (obj.latitude.nil? || obj.longitude.nil?) }

  def full_address
    [owner_address, owner_city, owner_province, owner_postal_code, "Canada"].compact.join(', ')
  end
end
