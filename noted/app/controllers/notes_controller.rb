class NotesController < ApplicationController
	def index
		@note = Note.new
		@note.id = 1
	end

	def create
		@notes = Note.new(note_params)
		if @notes.save
			redirect_to @notes
		else
			render ‘new’
		end
	end

	def edit
		@notes = Note.find(params[:noteId])
	end

	def new
		@notes = Note.new
	end

	def show
		@account = 1
		@note = Note.new
		@note.id = 1
	end

	private 
		def note_params
			params.require(:notes).permit(:title, :text)
		end
end
