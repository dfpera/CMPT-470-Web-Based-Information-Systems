class SessionsController < ApplicationController
	def index
	end

	def new
	end
	#login action
	def create
		if account = Account.find_by(username: params[:session][:username])
			if account.password == params[:session][:password]
				session[:user_id] = account.id
				redirect_to account_notes_path(account)
			else
				flash[:error] = "Invalid password"
				render 'new'
			end
		else
			flash[:error] = "Invalid username"
			render 'new'
		end
	end

	#logout action
	def destroy
		session[:user_id] = nil
		redirect_to(action: 'new')
	end
end