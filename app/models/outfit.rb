class Outfit < ActiveRecord::Base
  attr_accessible :is_favorite, :last_worn, :name, :user_id

  has_and_belongs_to_many :clothings
  belongs_to :user

  def self.generate
    outfit_type = rand(2)
    if outfit_type == 0
      tops = Clothing.joins(:type => :type_class).where('type_class.symbol' => 'top')
      bottoms = Clothing.joins(:type => :type_class).where('type_class.symbol' => 'btm')
      shoes = Clothing.joins(:type => :type_class).where('type_class.symbol' => 'shu')
      
      @outfit = Outfit.new
      @outfit.clothing << tops.shuffle.first
      @outfit.clothing << bottoms.shuffle.first
      @outfit.clothing << shoes.shuffle.first

    elsif outfit_type == 1
      full_outfits = Clothing.joins(:type => :type_class).where('type_class.symbol' => 'full')
      shoes = Clothing.joins(:type => :type_class).where('type_class.symbol' => 'shu')

      @outfit.clothing << @full_outfits.shuffle.first
      @outfit.clothing << @shoes.shuffle.first
    end
  end

  def toggle_favorite
    @outfit = Outfit.find(params[:id])
    @outfit.is_favorite = !@outfit.is_favorite
    @outfit.save
  end
end
