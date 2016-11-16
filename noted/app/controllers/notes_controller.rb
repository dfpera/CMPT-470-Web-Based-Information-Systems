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
	end

	def edit
		@notes = Notes.find(params[:noteId])
	end

	def new
		@notes = Notes.new
	end

	def show
		@notes = Note.find(params[:noteId])
	end

	private 
		def note_params			
			params.require(:notes).permit(:title,:text,:tags,:timeStamp,:noteId,:uid)
		end
end
