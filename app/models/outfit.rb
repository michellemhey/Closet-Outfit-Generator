class Outfit < ActiveRecord::Base
  attr_accessible :is_favorite, :last_worn, :name, :user_id

  has_and_belongs_to_many :clothings
  belongs_to :user

  def toggle_favorite
    @outfit = Outfit.find(params[:id])
    @outfit.is_favorite = !@outfit.is_favorite
    @outfit.save
  end
end
