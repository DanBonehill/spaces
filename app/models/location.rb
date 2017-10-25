class Location < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :point_of_contact, presence: true, length: { minimum: 3, maximum: 20 }
  validates :contact_number, presence: true, length: { minimum: 10, maximum: 20 }
  validates :max_occupancy, presence: true
  validates :price, presence: true
  # Validation does not work. Need to create custom validation
  # validates :features, :inclusion => { :in => ["Wifi", "Screen / Projector",
  #                                               "Air Conditioning", "Parking",
  #                                               "Great View", "Whiteboard",
  #                                               "Conference Call Phone",
  #                                               "Video Conferencing Facilities"] }
  validates :description, presence: true, length: { minimum: 10, maximum: 250 }

  has_one :address
end
