class Profile < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact_number, presence: true
  validates :member_id, presence: true
  
  belongs_to :member
end
