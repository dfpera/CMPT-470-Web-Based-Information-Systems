class NotesController < ApplicationController

	before_action :confirm_logged_in, :except => [:new, :newtag, :edit]
	after_action :extend_session

	def index
		# Get all notes where notes.account_id == account_id
		# account_id is retrieved from the url
		@notes = Note.where(:account_id => session[:account_id]) # .order("updated_at DESC")
		@tags = Tag.where(:account_id => session[:account_id])# .select(:tag_name, :pinned, :updated_at, :created_at)
		# Sort both notes and tags for display order
		@sortNotesLinks = []
		@sortTagsLinks = []
		sort_order
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

		def sort_order
			reverse = "Reversed"
			# Sorting Notes
			sortsNotes = ["alphabetical", "updated", "created", "tagged"]
			@sortNotesLinks = sortsNotes
			case params[:sortNotes]
			when sortsNotes[0] # Alphabetical
				@sortNotesLinks[0] += reverse
				@notes = @notes.order(title: :asc)
			when sortsNotes[0] + reverse # AlphabeticalReverse
				@notes = @notes.order(title: :desc)
			when sortsNotes[1] # Updated
				@sortNotesLinks[1] += reverse
				@notes = @notes.order(updated_at: :desc)
			when sortsNotes[1] + reverse # UpdatedReverse
				@notes = @notes.order(updated_at: :asc)
			when sortsNotes[2] # Created
				@sortNotesLinks[2] += reverse
				@notes = @notes.order(created_at: :desc)
			when sortsNotes[2] + reverse # CreatedReverse
				@notes = @notes.order(created_at: :asc)
			# when sortsNotes[3] # Tagged
			# 	@sortNotesLinks[3] += reverse
			# 	@notes = @notes.join(:tags)#.order(tag_name: :asc)
			# when sortsNotes[3] + reverse # TaggedReverse
				# @notes = @notes.order(tagged: :desc)
			else # Default (sort by updated)
				@sortNotesLinks[1] += reverse
				@notes = @notes.order(updated_at: :desc)
			end

			# Sorting Tags
			# sortsTags = ["alphabetical", "updated", "created", "pinned"]
			# @sortTagsLinks = sortsTags
			# case params[:sortTags]
			# when sortsTags[0] # Alphabetical
			# 	@sortTagsLinks[0] += reverse
			# 	@tags = @tags.order(tag_name: :asc)
			# when sortsTags[0] + reverse # AlphabeticalReverse
			# 	@tags = @tags.order(tag_name: :desc)
			# when sortsTags[1] # Updated
			# 	@sortTagsLinks[1] += reverse
			# 	@tags = @tags.order(updated_at: :desc)
			# when sortsTags[1] + reverse # UpdatedReverse
			# 	@tags = @tags.order(updated_at: :asc)
			# when sortsTags[2] # Created
			# 	@sortTagsLinks[2] += reverse
			# 	@tags = @tags.order(created_at: :desc)
			# when sortsTags[2] + reverse # CreatedReverse
			# 	@tags = @tags.order(created_at: :asc)
			# when sortsTags[3] # Pinned
			# 	@sortTagsLinks[3] += reverse
			# 	@tags = @tags.order(pinned: :asc)
			# when sortsTags[3] + reverse # PinnedReverse
			# 	@tags = @tags.order(pinned: :desc)
			# else # Default (sort by pinned)
			# 	@sortTagsLinks[3] += reverse
			# 	@tags = @tags.order(pinned: :asc)
			# end
		end
end
