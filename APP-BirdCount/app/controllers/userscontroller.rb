class UsersController < ApplicationController
    get '/create_account' do
        if !logged_in?
            erb :'users/create_user'
        else 
            redirect to ('/guides')
        end
    end

    post '/create_account' do #restful route should be named '/users' to align with controller name
       #this will persist info from user into db
        @user = User.new(params)
        if !@user.save
            @errors = @user.errors.full_messages
            # binding.pry
            erb :'users/create_user'
        else 
            session[:user_id] = @user.id
            redirect to ('/guides')
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to ('/guides')
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username]) 
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            redirect '/guides'
        else
            @errors = "Name and/or Password is Incorrect"
            erb :'users/login'
        end
    end

    get '/logout' do
        session.destroy
        redirect to ('/')
    end

end