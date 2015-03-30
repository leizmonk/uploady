class PhotosController < ApplicationController
  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to photos_path(@photo)
    else  
      render :new
    end
  end

  # Only this instance of the PhotosController can access the params
  private

  def photo_params
    params.require(:photo).permit(:filename, :caption)
  end
end
