class Profile < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :contact_number, presence: true, length: { minimum: 10, maximum: 20 }
  validates :member_id, presence: true

  has_attached_file :profile_pic,
    styles: { thumb: "100x100#" },
    default_url: "/images/:style/missing.png",
    :bucket => ENV['S3_BUCKET_NAME'],
    :url => ":s3_domain_url",
    :path => "profiles/profile_pic/:id/:style/:filename"
    validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  belongs_to :member

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
