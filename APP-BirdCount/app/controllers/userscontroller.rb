class UsersController < ApplicationController
    get '/create_account' do
        if !session[:user_id]
            erb :'users/create_user'
        else 
            redirect to ('/guides')
        end
    end

    post '/create_account' do
        @user = User.new(params)
        if !@user.save
            @errors = @user.errors.full_messages
            erb :'users/create_user'
        else 
            session[:user_id] = @user.id
            redirect to ('/guides')
        end
    end

    get '/login' do
        if !session[:user_id]
            erb :'users/login'
        else
            redirect to ('/guides')
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username]) 
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            @current_user = User.find_by(id: session[:id])
            redirect '/guides'
        else
            @errors = "Name and/or Password is Incorrect"
            erb :'users/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to ('/')
        else
            redirect to ('/')
        end
    end

end