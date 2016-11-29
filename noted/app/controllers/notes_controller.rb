class NotesController < ApplicationController

	before_action :confirm_logged_in

	def index
		#Get all notes where notes.account_id == account_id
		#account_id is retrieved from the url
		@notes = Note.where(:account_id => session[:account_id])
		@tags = Tag.where(:account_id => session[:account_id])
		@tagNames = @tags.select('DISTINCT tag_name')
	end

	def create
		@account = Account.find(session[:account_id])
		@note = Note.new(note_params)

		@note.account_id = session[:account_id]

		if @note.save

			tags = params[:tags]
			if tags
				tags.each do |tag|
					@tag = Tag.new()
					@tag.tag_name = tag
					@tag.account_id = session[:account_id]
					@tag.note_id = @note.id
					@tag.save
				end
			end

			redirect_to notes_path
		else
			render 'new'
		end
	end

	def new
		@noteform = params[:noteform]
		@account = Account.find(session[:account_id])
		@note = Note.new
		@tag = Tag.new
	end

	def createtag
		@tag = Tag.new(tag_params)
		@tag.account_id = session[:account_id]
		@tag.note_id = nil

		if @tag.save
			redirect_to notes_path
		else
			render 'newtag'
		end
	end

	def newtag
		@noteform = params[:noteform]
		@tag = Tag.new
	end

	def show
		@notes = Note.all
	end

	def edit
		@note = Note.find(params[:id])
		@account = Account.find(session[:account_id])
		@tags = Tag.where(:note_id => params[:id])
	end

	def update
		@account = Account.find(session[:account_id])
		@note = Note.find(params[:id])

		if @note.update(note_params)
			redirect_to notes_path
		else
			render 'edit'
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy

		redirect_to notes_path
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
