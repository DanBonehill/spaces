class Address < ApplicationRecord

  validates :line_1, presence: true, length: { minimum: 5, maximum: 30 }
  validates :line_2, allow_blank: true, length: { minimum: 5, maximum: 40 }
  validates :city, presence: true, length: { minimum: 5, maximum: 20 }
  validates :postcode, presence: true, length: { minimum: 6, maximum: 8 }

  validates_numericality_of :latitude, :allow_nil => true
  validates_numericality_of :longitude, :allow_nil => true

  belongs_to :location

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.line_1.present? and obj.address_changed? }

  def address_changed?
    line_1_changed? || line_2_changed? || city_changed? || postcode_changed?
  end

  private

  def full_address
    [line_1, line_2, city, postcode].compact.join(", ")
  end
end
