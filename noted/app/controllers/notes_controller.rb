class NotesController < ApplicationController
	def index
	end

	def create
		@notes = Notes.new(note_params)
		if @notes.save
			redirect_to @notes
		else
			render ‘new’
		end

	def edit
		@notes = Notes.find(params[:noteId])

	def new
		@notes = Notes.new

	def show
		@notes = Note.find(params[:noteId])

	private 
		def note_params			
			params.require(:notes).permit(:title,:text,:tags:timeStamp,:noteId,:uid)
		end
end
