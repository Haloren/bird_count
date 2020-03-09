class UsersController < ApplicationController
    get '/create_account' do
        if !session[:user_id]
            erb: 'users/create_user'
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
        @user = User.find_by(username: params[:username]) #use email instead?
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to('/guides')
        else
            @errors = "Name and/or Password is Incorrect"
            erb: 'users/login'
        end
    end

    get '/logout' do
        if logged_in?
            @user = current_user
            @user = nil
            session.destroy
            redirect to ('/')
        else
            redirect to ('/')
        end
    end

end