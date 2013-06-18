class Clothing < ActiveRecord::Base
  attr_accessible :description, :image_path, :is_dirty, :name, :type_id, :user_id
  has_many :types
  belongs_to :user

  validates_presence_of :name
end
