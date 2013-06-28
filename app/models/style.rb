class Style < ActiveRecord::Base
  attr_accessible :label
  has_and_belongs_to_many :clothing
end
