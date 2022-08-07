class ChatsController < ApplicationController
    before_action :authenticate_request
    attr_reader :current_application, :chats
    
    def index
      
    end

    def create
        # chat =  ChatJob.perform_async(params[:title], @current_application.id)

        chat_number = chatNumber(@current_application.id)
        chat = Chat.new
        chat.title = params[:title]
        chat.application_id = @current_application.id
        chat.chat_number = chat_number
        if chat.save
            render json: { chat_number:chat.chat_number}, status: 201
        else
            render json:  chat.errors , status: :unprocessable_entity
        end

    end

    def chatNumber(application_id)
        last_chat = Chat.where(application_id:application_id).last
        chat_number = 1
        if last_chat 
            chat_number = last_chat.chat_number + 1
        end
        return chat_number
    end

    
end
