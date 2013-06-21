class Photo < ActiveRecord::Base
  attr_accessible :image, :property_id
  belongs_to :property
  mount_uploader :image, PhotoUploader
end
