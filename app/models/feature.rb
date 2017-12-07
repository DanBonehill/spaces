class Feature < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false },
                    length: { minimum: 1, maximum: 30 }

  has_and_belongs_to_many :locations, join_table: "locations_features"
end
