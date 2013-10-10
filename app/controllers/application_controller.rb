class ApplicationController < ActionController::Base
  protect_from_forgery

  	helper_method :current_user

	private
	def current_user
	  @current_user ||= User.find(session[:user]) if session[:user]
	rescue ActiveRecord::RecordNotFound
	    session[:user] = nil
	end
end
