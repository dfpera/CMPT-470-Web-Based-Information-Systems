class NotesController < ApplicationController

	before_filter :authenticate

	def index
		#Get all notes where notes.account_id == account_id
		#account_id is retrieved from the url
		@notes = Note.where(:account_id => params[:account_id])
		@tags = Tag.where(:account_id => params[:account_id])
		@tagNames = @tags.select('DISTINCT tag_name')
	end

	def create
		@account = Account.find(params[:account_id])
		@note = Note.new(note_params)

		@note.account_id = params[:account_id]

		if @note.save
			
			@tag = Tag.new(tag_params)
			@tag.account_id = params[:account_id]
			@tag.note_id = @note.id
			@tag.save

			redirect_to account_notes_path(@account)
		else
			render 'new'
		end
	end

	def new
		@account = Account.find(params[:account_id])
		@note = Note.new
		@tag = Tag.new
	end

	def show
		@notes = Note.all
	end

	private 
		def note_params
			params.require(:note).permit(:title,:text,:account_id)
		end

		def tag_params
			params.require(:tag).permit(:tag_name)
		end

		def authenticate
			if Account.find_by(id: params[:account_id])
				if Account.find(params[:account_id]).id == session[:user_id]
					return true
				else
					flash[:error] = "You are not signed in to that account"
					redirect_to login_path
					return false
				end
			else
				flash[:error] = "User does not exist"
				redirect_to login_path
				return false
			end
		end
end
