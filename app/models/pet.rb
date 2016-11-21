class Pet < ApplicationRecord

  belongs_to :user
  attr_accessor :facebook_post_this
  # attr_accessor :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode
  mount_uploader :images, UserImageUploader

  validates :pet_type, presence: true
  validates :sex, presence: true
  validates :color, presence: true
  # must be before today's date; search on that later
  # validates :date_seen, presence: true
  validates :address, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 0 }
end
