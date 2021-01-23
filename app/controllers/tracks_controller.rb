class TracksController < ApplicationController
  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @album = Album.find_by(id: params[:album_id])
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def create
      
  end

  def edit
      
  end

  def update
      
  end

  def destroy
      
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :bonus, :lyrics)
  end
end