require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "findmybird"
  end

  get "/" do
    if @current_account
      redirect to ('/guides')
    else 
      erb :welcome
    end 
  end

  helpers do

    def current_account
      @current_account ||= User.find(session[:id])
    end
  
    def logged_in?
      !!current_account
    end

  end

end
