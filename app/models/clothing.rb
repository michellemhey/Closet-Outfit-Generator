class Clothing < ActiveRecord::Base
  attr_accessible :description, :image_path, :is_dirty, :name, :type_id, :user_id
  belongs_to :type
  belongs_to :user
  has_and_belongs_to_many :outfits
  has_and_belongs_to_many :temperatures
  mount_uploader :image_path, ImageUploader

  validates :name, :presence => true
  validates :type_id, :presence => true
  validates :user_id, :presence => true

  def self.get_by_type_class(type_class, user_id)
    Clothing.joins(:type => :type_class).where('type_classes.symbol' => type_class, :user_id => user_id)
  end
end
