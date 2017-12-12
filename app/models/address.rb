class Address < ApplicationRecord

  validates :line_1, presence: true, length: { minimum: 5, maximum: 30 }
  validates :line_2, allow_blank: true, length: { minimum: 5, maximum: 40 }
  validates :city, presence: true, length: { minimum: 5, maximum: 20 }
  validates :postcode, presence: true, length: { minimum: 6, maximum: 8 }

  belongs_to :location
end
