class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  SESSION_LENGTH = 1.minute

  private
  def confirm_logged_in
    if !session[:account_id] && !session[:expires_at]
      flash[:notice] = "Please log in."
      redirect_to(accounts_path)
    end
    if session[:expires_at] < Time.now
      flash[:notice] = "Please log in. Your session has expired."
      redirect_to(accounts_path)
    end
  end

  def already_logged_in
    if session[:account_id] && (session[:expires_at] > Time.now)
      flash[:notice] = "Welcome to Noted."
      redirect_to(notes_path)
    end
  end

  def extend_session
    if session[:expires_at] > Time.now
      session[:expires_at] = Time.now + SESSION_LENGTH
    end
  end
end
