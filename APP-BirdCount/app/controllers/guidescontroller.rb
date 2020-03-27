class GuidesController < ApplicationController

    get '/guides' do
        if logged_in?
            @guides = current_account.guides
            erb :'guides/index'
        else 
            redirect to ('/login')
        end
    end

    get '/guides/new' do
        if logged_in?
            @current_account
            erb :'guides/create_guide'
        else 
            redirect to('/login')
        end
    end

    post '/guides' do
        if logged_in?
            @guide = current_account.guides.build(params)
            if !@guide.save
                @errors = @guide.errors.full_messages
                erb :'/guides/create_guide'
            else
                redirect to('/guides')
            end
        else 
            redirect to ('/login')
        end
    end

    get '/guides/:id' do
        @guide = Guide.find(params[:id])
        if logged_in? && @guide.user == current_account
            erb :'guides/show_guide'
        else
            redirect to ('/login')
        end
    end

    get '/guides/:id/edit' do
        @guide = Guide.find(params[:id])
        if logged_in? && @guide.user == current_account
            @guide = Guide.find(params[:id])
            @user = User.find(session[:id])
            erb :'guides/update_guide'
        else
            redirect to ('/login')
        end
    end

    patch '/guides/:id' do
        @guide = Guide.find(params[:id])
        # @guide.bird = params[:bird]
        # @guide.notes = params[:notes]
        # @guide.date = params[:date]
        # if !@guide.save
        if !@guide.update(bird: params[:bird], notes: params[:notes], date: params[:date])

            @errors = @guide.errors.full_messages
            erb :'/guides/update_guide'
        else 
            redirect to ("/guides/#{@guide.id}")
        end
    end

    delete '/guides/:id/delete' do
        @guide = Guide.find(params[:id])
        if logged_in? && @guide.user == current_account
            @guide.destroy
            redirect to ('/guides')
        else 
            redirect to ('/login')
        end
    end

end