class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    if params[:images]
      params[:images].each do |img|
        flash[:error] = 'Something went wrong' unless @room.photos.create(image: img)
      end
      @photos = @room.photos
      redirect_back(fallback_location: request.referer, notice: 'Saved')
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @room = @photo.room
    @photo.image.file.delete
    @photo.destroy
    @photos = Photo.where(room_id: @room.id)
    respond_to :js
  end
end
