class NotesController < ApplicationController
	before_action :require_signed_in

	def create
		@note = Note.new(note_params)
		@track = Track.find(params[:track_id])

		if @note.save
			redirect_to track_url(@track)
		else
			flash.now[:errors] = @note.errors.full_messages
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@track = Track.find(@note.track_id)
		@note.destroy
		redirect_to track_url(@track)
	end

	private

	def note_params
		params.require(:note).permit(:user_id, :track_id, :body)
	end
end
