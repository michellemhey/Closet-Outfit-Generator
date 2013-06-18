class TypeClass < ActiveRecord::Base
  attr_accessible :name, :symbol
  belongs_to :type
end
