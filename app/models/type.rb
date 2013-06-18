class Type < ActiveRecord::Base
  attr_accessible :description, :name, :type_class_id
  has_one :type_class
  belongs_to :clothing
end
