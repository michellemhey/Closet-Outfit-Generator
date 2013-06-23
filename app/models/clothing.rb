class Clothing < ActiveRecord::Base
  attr_accessible :description, :image_path, :is_dirty, :name, :type_id, :user_id
  belongs_to :type
  belongs_to :user
  has_and_belongs_to_many :outfits
end
