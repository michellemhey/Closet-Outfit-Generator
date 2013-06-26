class Temperature < ActiveRecord::Base
  attr_accessible :high, :label, :low

  validates :high, :presence => true
  validates :label, :presence => true
  validates :low, :presence => true
end
