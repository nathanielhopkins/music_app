class NotesController < ApplicationController
  before_action :require_login!

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    flash.now[:errors] = @note.errors.full_messages

    redirect_to track_url(@note.track_id)
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if @note.user_id == current_user.id
      @note.destroy 
      redirect_to track_url(@note.track_id)
    else
      render text: "Nice try, but you don't have permission to delete that."
    end
  end

  private
  def note_params
    params.require(:note).permit(:track_id, :content)
  end
end