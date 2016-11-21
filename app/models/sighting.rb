class Sighting < ApplicationRecord

  belongs_to :user
  attr_accessor :facebook_post_this
  # attr_accessor :address, :latitude, :longitude
  geocoded_by :address
  # after_validation: :geocode
  mount_uploader :images, UserImageUploader

  validates :pet_type, presence: true
  validates :date_seen, presence: true
  validates :address, presence: true

end
