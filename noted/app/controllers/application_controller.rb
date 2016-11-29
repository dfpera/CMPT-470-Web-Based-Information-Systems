class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def confirm_logged_in
    unless session[:account_id]
      flash[:notice] = "Please log in."
      redirect_to(accounts_path)
    end
  end

  def already_logged_in
    if session[:account_id]
      flash[:notice] = "Welcome to Noted."
      redirect_to(notes_path)
    end
  end
end
