class Clothing < ActiveRecord::Base
  attr_accessible :description, :image_path, :is_dirty, :name, :type_id, :user_id, :image
  belongs_to :type
  belongs_to :user
  mout_uploader :image, ImageUploader

end
