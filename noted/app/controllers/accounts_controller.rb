class AccountsController < ApplicationController
	before_action :already_logged_in

	def index
	end

	def new
		@account = Account.new
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

	def login
		if params[:username].present? && params[:password].present?
			found_user = Account.where(:username => params[:username]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end

		if authorized_user
			session[:account_id] = authorized_user.id
			flash[:notice] = "Welcome to Noted!"
			redirect_to(notes_path)
		else
			flash.now[:notice] = "Invalid username/password combination."
			render('index')
		end
	end

	def logout
		session[:account_id] = nil
		flash[:notice] = "Successfully logged out."
		redirect_to(accounts_path)
	end

	private
	def account_params
		params.require(:account).permit(:username, :password)
	end
end
