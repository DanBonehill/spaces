class Image < ApplicationRecord
  validates :caption, length: { minimum: 5, maximum: 50 }, allow_nil: true
  validates :location_id, presence: true

  has_attached_file :image_pic,
    styles: { thumb: "100x100#" },
    default_url: "/images/:style/missing.png",
    :bucket => ENV['S3_BUCKET_NAME'],
    :url => ":s3_domain_url",
    :path => "locations/image_pic/:id/:style/:filename"
    validates_attachment_content_type :image_pic, content_type: /\Aimage\/.*\z/

  belongs_to :location
end
