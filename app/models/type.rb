class Type < ActiveRecord::Base
  attr_accessible :description, :name, :type_class_id
  belongs_to :type_class
  has_many :clothing

  validates :name, :presence => true
  validates :type_class_id, :presence => true
end
