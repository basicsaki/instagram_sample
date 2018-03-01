class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :instauser
  helper_method :logged_in?

  private

  def logged_in?
    if session[:instauser_id] == nil
      false
    else
      true
    end
  end
  
  def instauser
  	if session[:instauser_id] != nil
  	  instauser ||= InstagramUser.find_by(insta_id: session[:instauser_id]) 
    else
  	  redirect_to :controller => 'sessions', :action => 'connect' 
  	end
  end

end
