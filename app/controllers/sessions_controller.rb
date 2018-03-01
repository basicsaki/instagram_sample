class SessionsController < ApplicationController

  before_action :set_client

  def connect
    redirect_to @client.authorization_url
  end

  def callback
    code = params[:code]
  	response = @client.get_access_token( params[:code] )
    @client.set_or_update_user_details(response)
  	session[:instauser_id] = response["user"]["id"]
  	redirect_to pages_user_pics_path
  end

  def disconnect
  	session[:instauser_id] = nil
  	redirect_to root_path
  end

  private

  def set_client
    @client = Instaimplement::Connect.new(ENV["insta_client_id"],ENV["insta_client_secret"],ENV["callback_url"])
  end

end