class Outfit < ActiveRecord::Base
  attr_accessible :is_favorite, :last_worn, :name, :user_id

  has_and_belongs_to_many :clothings
  belongs_to :user

  def self.generate
    outfit_type = rand(2)
    if outfit_type == 0
      tops = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'top')

      bottoms = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'btm')

      shoes = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'shu')
      
      @selected = []
      @selected << tops.shuffle.first
      @selected << bottoms.shuffle.first
      @selected << shoes.shuffle.first

    elsif outfit_type == 1
      full_outfits = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'full')

      shoes = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'shu')

      @selected = []
      @selected << @full_outfits.shuffle.first
      @selected << @shoes.shuffle.first
    end
  end

  def toggle_favorite
    @outfit = Outfit.find(params[:id])
    @outfit.is_favorite = !@outfit.is_favorite
    @outfit.save
  end
end
