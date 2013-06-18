class TypeClass < ActiveRecord::Base
  attr_accessible :name, :symbol
  belongs_to :type

  validates :name, :presence => true
  validates :symbol, :presence => true
end
