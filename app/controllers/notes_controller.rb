class NotesController < ApplicationController
  before_action :require_login!

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    flash.now[:errors] = @note.errors.full_messages
    
    redirect_to track_url(@note.track)
  end

  private
  def note_params
    params.require(:note).permit(:track_id, :content)
  end
end