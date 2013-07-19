class Temperature < ActiveRecord::Base
  attr_accessible :high, :label, :low

  has_and_belongs_to_many :clothings

  validates :high, :presence => true
  validates :label, :presence => true
  validates :low, :presence => true
end