class Location < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :point_of_contact, presence: true, length: { minimum: 3, maximum: 20 }
  validates :contact_number, presence: true, length: { minimum: 10, maximum: 20 }
  validates :max_occupancy, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 250 }

  has_one :address
  has_many :images
  has_and_belongs_to_many :features, join_table: "locations_features"

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :images
end
