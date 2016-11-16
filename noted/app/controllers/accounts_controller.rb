class AccountsController < ApplicationController
	def index
	end

	def login
	end

	def create
		@account = Account.new(account_params)
	end
	private
		def account_params
			params.require(:account).permit(:emailAddress, :firstName,   :lastName, :password)
	end
end
