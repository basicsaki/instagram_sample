class PagesController < ApplicationController

  helper_method :client

  def home
      redirect_to pages_user_pics_path if logged_in?
  end

  def user_pics
    @user_recent_media = client.recent_media(-1)[:data]
    @user_info = client.information
  end

  def integration
    
  end

protected

  def client
    client ||= Instaimplement::Endpoints.new(instauser.access_token)
  end 
end
