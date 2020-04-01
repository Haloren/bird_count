class GuidesController < ApplicationController

    get '/guides' do #goes to index.erb
        if logged_in?
            @guides = current_account.guides
            erb :'guides/index'
        else 
            redirect to ('/login')
        end
    end

    get '/guides/new' do #goes to create_guide.erb
        if logged_in?
            @current_account
            erb :'guides/create_guide'
        else 
            redirect to('/login')
        end
    end

    post '/guides' do #POST goes to create_guide.erb
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

    get '/guides/:id' do #key- :id value- id number    goes to show_guide.erb
        @guide = Guide.find(params[:id]) #used this line of code several times in this class can be refactored into a helper method (look up how to use private)
        if logged_in? && @guide.user == current_account
            erb :'guides/show_guide'
        else
            redirect to ('/login')
        end
    end

    get '/guides/:id/edit' do #goes to update_guide.erb for edit form
        @guide = Guide.find(params[:id]) #used this line of code several times in this class can be refactored into a helper method (look up how to use private)
        if logged_in? && @guide.user == current_account
            @guide = Guide.find(params[:id])
            @user = User.find(session[:id])
            erb :'guides/update_guide'
        else
            redirect to ('/login')
        end
    end

    patch '/guides/:id' do
        #PATCH goes to update_guide.erb
        @guide = Guide.find(params[:id]) #used this line of code several times in this class can be refactored into a helper method (look up how to use private)
        # @guide.bird = params[:bird]
        # @guide.notes = params[:notes]
        # @guide.date = params[:date]
        # if !@guide.save
        if logged_in? && @guide.user == current_account && !@guide.update(bird: params[:bird], notes: params[:notes], date: params[:date])
            @errors = @guide.errors.full_messages
            erb :'/guides/update_guide'
        else 
            redirect to ("/guides/#{@guide.id}")
        end
    end

    delete '/guides/:id/delete' do #/delete is not needed
        @guide = Guide.find(params[:id]) #used this line of code several times in this class can be refactored into a helper method (look up how to use private)
        if logged_in? && @guide.user == current_account
            @guide.destroy
            redirect to ('/guides')
        else 
            redirect to ('/login')
        end
    end

end