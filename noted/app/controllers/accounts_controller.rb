class AccountsController < ApplicationController
	before_action :already_logged_in, :except => [:logout]

	def index
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		if @account.save
			session[:account_id] = @account.id
			session[:expires_at] = Time.now + SESSION_LENGTH
			redirect_to(notes_path)
		else
			flash.now[:notice] = "Cannot create new account due to the following errors:"
			render('new')
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
			session[:expires_at] = Time.now + SESSION_LENGTH
			flash[:success] = "Welcome to Noted!"
			redirect_to(notes_path)
		else
			flash[:error] = "Invalid username/password combination."
			redirect_to(accounts_path)
		end
	end

	def logout
		session[:account_id] = nil
		session[:expires_at] = Time.now
		flash[:success] = "Successfully logged out."
		redirect_to(accounts_path)
	end

	private
	def account_params
		params.require(:account).permit(:username, :password, :password_confirmation)
	end
end
