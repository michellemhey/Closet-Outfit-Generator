class OutfitController < ApplicationController

  def new
    @tops = Clothing.get_by_type_class('top', current_user.id).shuffle!
    @bottoms = Clothing.get_by_type_class('btm', current_user.id).shuffle!
    @shoes = Clothing.get_by_type_class('shu', current_user.id).shuffle!

    @temperatures = Temperature.all
    @filter_temps = []
  end

  def filter

    @temperatures = Temperature.all

    if params[:temperature_ids].nil? or params[:temperature_ids].empty?
      @filter_temps = []
      @tops = Clothing.get_by_type_class('top', current_user.id).shuffle!
      @bottoms = Clothing.get_by_type_class('btm', current_user.id).shuffle!
      @shoes = Clothing.get_by_type_class('shu', current_user.id).shuffle!
    else
      @filter_temps = params[:temperature_ids].map {|x| Integer(x)}

      #Get basic clothes
      @tops = Clothing.get_by_type_class('top', current_user.id) 
      @bottoms = Clothing.get_by_type_class('btm', current_user.id)
      @shoes = Clothing.get_by_type_class('shu', current_user.id) 

      #Apply filters
      @tops = @tops.select { |top| !(top.temperature_ids & @filter_temps).empty? }
      @bottoms = @bottoms.select {|bottom| !(bottom.temperature_ids & @filter_temps).empty? }
      @shoes = @shoes.select {|shoe| !(shoe.temperature_ids & @filter_temps).empty? }

      #Randomize
      @tops = @tops.shuffle!
      @bottoms = @bottoms.shuffle!
      @shoes = @shoes.shuffle!
    end
    render :action => 'new'

  end

  def create
    failed = false
    @outfit = Outfit.new
    @outfit.is_favorite = params[:is_favorite]
    @outfit.user = current_user
    if (params[:wear_now])
      @outfit.last_worn = Time.now()
    end
    if @outfit.save
      clothings = params[:clothings].map { |id| Clothing.find(Integer(id)) }
      if @outfit.clothings << clothings
        print("Injected.")
        redirect_to @outfit
      else
        failed = true
      end
    else
      failed = true
    end

    if failed
      @tops = Clothing.get_by_type_class('top', current_user.id).shuffle!
      @bottoms = Clothing.get_by_type_class('btm', current_user.id).shuffle!
      @shoes = Clothing.get_by_type_class('shu', current_user.id).shuffle!
      render :action => 'new'
    end
  end

  def edit
    @outfit = Outfit.find(params[:id])
    @clothings = Clothing.get_by_type_class('top', current_user.id)
  end

  def update
    @outfit = Outfit.find(params[:id])
    @outfit.update(params)
    if @outfit.save
      redirect_to :action => 's'
    else
      @clothings = Clothing.all
      render :action => 'edit'
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
    @top = (@outfit.clothings & (Clothing.get_by_type_class('top', current_user).to_a)).first
    @bottom = (@outfit.clothings & (Clothing.get_by_type_class('btm', current_user).to_a)).first
    @shoes = (@outfit.clothings & (Clothing.get_by_type_class('shu', current_user).to_a)).first
  end

  def index
    @outfits = Outfit.all
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    if @outfit.destroy
      redirect_to :action => 'index'
    end
  end

  def set_favorite
    @outfit = Outfit.find_or_create(params[:outfit])
    @outfit.is_favorite = true
    @outfit.save
  end

  def unset_favorite
    @outfit = Outfit.find(params[:id])
    @outfit.is_favorite = false
    @outfit.save
  end

  def get_favorite
    @is_favorite = Outfit.find(params[:id]).is_favorite
  end
end
