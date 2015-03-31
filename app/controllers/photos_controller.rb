class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @photos = current_user.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    # Specify that this new photo object will belong to the current user
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to photos_path(@photo)
    else  
      render :new
    end
  end

  def edit
    # Specify that only photos that have a matching user_id can be edited by current user
    @photo = current_user.photos.find(params[:id])
  end

  def update
    @photo = current_user.photos.find(params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to photos_path(@photo)
    else
      render :edit
    end
  end

  # Only this instance of the PhotosController can access the params
  private

  def photo_params
    params.require(:photo).permit(:filename, :caption)
  end
end
