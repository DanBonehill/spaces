class Profile < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :contact_number, presence: true, length: { minimum: 10, maximum: 20 }
  validates :member_id, presence: true

  belongs_to :member

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
