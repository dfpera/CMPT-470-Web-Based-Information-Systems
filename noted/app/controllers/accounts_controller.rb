class AccountsController < ApplicationController
	def index
	end

	def new
		@account = Account.new
	end

	def show
	end

	def create
		@account = Account.new(account_params)
		if @account.save
			session[:user_id] = @account.id
			redirect_to account_notes_path(@account)
		else
			render 'new'
		end
	end
	private
		def account_params
			params.require(:account).permit(:username, :first_name, :last_name, :password)
		end
end
