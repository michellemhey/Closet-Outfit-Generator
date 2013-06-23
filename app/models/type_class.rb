class TypeClass < ActiveRecord::Base
  attr_accessible :name, :symbol
  has_many :type

  validates :name, :presence => true
  validates :symbol, :presence => true
end
