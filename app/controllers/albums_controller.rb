class AlbumsController < ApplicationController
  def show
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
    render :show
  end

  def new
    @band = Band.find_by(id: params[:band_id])
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      @band = @album.band
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @band = @album.band
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @album = Album.find_by(id: params[:id])
    @album.delete
    redirect_to band_url(@album.band_id)
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :live_album)
  end
end