# app/controllers/photos_controller.rb
class PhotosController < ApplicationController
  
  before_filter :require_user
  before_filter :find_property
  before_filter :find_or_build_photo
  
  def create
    respond_to do |format|
      unless @photo.save
        flash[:error] = 'Photo could not be uploaded'
      end
      format.js do
        render :text => render_to_string(:partial => 'photos/photo', :locals => {:photo => @photo})
      end
    end
  end
 
  def destroy
    respond_to do |format|
      unless @photo.destroy
        flash[:error] = 'Photo could not be deleted'
      end
      format.js
    end
  end
 
  private
    
    def find_property
      @property = current_user.properties.find(params[:property_id])
      raise ActiveRecord::RecordNotFound unless @property
    end
    
    def find_or_build_photo
      @photo = params[:id] ? @property.photos.find(params[:id]) : @property.photos.build(params[:photo])
    end
 
end