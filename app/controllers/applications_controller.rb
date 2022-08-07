class ApplicationsController < ApplicationController

    def index
        applications = Application.all
        applications = Application.select(:name, :authentication_token, :chats_count)
        render json: { applications: applications }, status: 201
      end

    def create
        application = Application.new(application_params)
        if application.save
            render json: { auth_token: application.authentication_token }, status: 201
        else
            render json:  application.errors , status: :unprocessable_entity
        end
    end

    def update
        application = Application.find(params[:id])   
        
        if application.update(application_params)
            render json: { auth_token: application.authentication_token }, status: 200
        else
            render json:  application.errors , status: :unprocessable_entity
        end
    end
    
    def application_params
        params. permit(:name, :chats_count, :authentication_token)       
    end

    def chats
        application = Application.where(authentication_token:params[:application_token]).first
        chats = Chat.all
        render json: { chats: chats }, status: 200
    end


end
