class NotesController < ApplicationController
	before_action :confirm_logged_in, :except => [:new, :newtag, :edit]
	after_action :extend_session

	def index
		# Get all notes where notes.account_id == account_id
		# account_id is retrieved from the url
		@account = Account.find(session[:account_id])
		@notes = @account.notes
		@tags = @account.tags
		# Sort both notes and tags for display order
		@sortNotesLinks = []
		@sortTagsLinks = []
		sort_order
	end

	def create
		@account = Account.find(session[:account_id])

		@note = Note.new(note_params)
		@account.notes << @note
		if !(@note.new_record?)
			tags = params[:tags]
			if tags
				tags.each do |tag|
					@tag = Tag.find_by_tag_name(tag)
					if !@tag
						@tag = Tag.new({:account_id => @account.id, :tag_name => tag, :pinned => false})
					end
					@note.tags << @tag
				end
			end
		else
			render 'new'
		end

	end

	def new
		@note = Note.new
		@tag = Tag.new
	end

	def newtag
		@tag = Tag.new
	end

	def createtag
		@tag = Tag.new(tag_params)
		@tag.account_id = session[:account_id]

		if @tag.save
		
		else
			render 'newtag'
		end
	end

	# TODO: Use this for permalink or remove it completely
	def show
	end

	def edit
		@note = Note.where(account_id: session[:account_id], id: params[:id]).first
		@tags = @note.tags
	end

	# TODO: Update doesn't work when a validation fails
	def update
		@note = Note.where(account_id: session[:account_id], id: params[:id]).first

		if @note.update_attributes(note_params)

		else
			render 'edit'
		end
	end

	def pintag
		@tag = Tag.where(account_id: session[:account_id], id: params[:format]).first
		@tag.pinned = !@tag.pinned
		@tag.save
	end

	def destroy
		@note = Note.where(account_id: session[:account_id], id: params[:id]).first
		@note.destroy
	end

	def destroytag
		@tag = Tag.where(account_id: session[:account_id], id: params[:format]).first
		@tag.destroy
	end

	private
		def note_params
			params.require(:note).permit(:account_id, :permalink, :title, :text, :alarm)
		end

		def tag_params
			params.require(:tag).permit(:account_id, :tag_name,  :pinned)
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
			when sortsNotes[3] # Tagged
				@sortNotesLinks[3] += reverse
				@notes = @notes.order(updated_at: :desc)
				untagged = []
				tagged = []
				@notes.each do |note|
					if note.tags.empty?
						untagged << note
					else
						tagged << note
					end
				end
				@notes = []
				untagged.each do |note|
					@notes << note
				end
				tagged.each do |note|
					@notes << note
				end
			when sortsNotes[3] + reverse # TaggedReverse
				@notes = @notes.order(updated_at: :desc)
				untagged = []
				tagged = []
				@notes.each do |note|
					if note.tags.empty?
						untagged << note
					else
						tagged << note
					end
				end
				@notes = []
				tagged.each do |note|
					@notes << note
				end
				untagged.each do |note|
					@notes << note
				end
			else # Default (sort by updated)
				@sortNotesLinks[1] += reverse
				@notes = @notes.order(updated_at: :desc)
			end

			# Sorting Tags
			sortsTags = ["alphabetical", "updated", "created", "pinned"]
			@sortTagsLinks = sortsTags
			case params[:sortTags]
			when sortsTags[0] # Alphabetical
				@sortTagsLinks[0] += reverse
				@tags = @tags.order(tag_name: :asc)
			when sortsTags[0] + reverse # AlphabeticalReverse
				@tags = @tags.order(tag_name: :desc)
			when sortsTags[1] # Updated
				@sortTagsLinks[1] += reverse
				@tags = @tags.order(updated_at: :desc)
			when sortsTags[1] + reverse # UpdatedReverse
				@tags = @tags.order(updated_at: :asc)
			when sortsTags[2] # Created
				@sortTagsLinks[2] += reverse
				@tags = @tags.order(created_at: :desc)
			when sortsTags[2] + reverse # CreatedReverse
				@tags = @tags.order(created_at: :asc)
			when sortsTags[3] # Pinned
				@sortTagsLinks[3] += reverse
				@tags = @tags.order(pinned: :desc)
			when sortsTags[3] + reverse # PinnedReverse
				@tags = @tags.order(pinned: :asc)
			else # Default (sort by pinned)
				@sortTagsLinks[3] += reverse
				@tags = @tags.order(pinned: :desc)
			end
		end
end