class SessionsController < ApplicationController
	def index
	end

	def new
	end
	#login action
	def create
		if account = Account.find_by(username: params[:session][:username])
			if account.password == params[:session][:password]
				redirect_to account_notes_path(account)
			else
			end
		else
		end
	end
end