class MessagesController < ApplicationController

    before_action :authenticate_request
    attr_reader :current_application, :messages
    

    def create
        # response = MessageJob.perform_async(params[:body], params[:chat_number])
        chat = Chat.find(params[:chat_number])
        message_number = messageNumber(chat.id)
        message = Message.new
        message.body = params[:body]
        message.chat_id = chat.id
        message.message_number = message_number
        if message.save
            render json: { message_number: message.message_number}, status: 201      
        else
            render json:  message.errors , status: :unprocessable_entity
        end
        
      end
    
    def messageNumber(chat_id)
        last_message = Message.where(chat_id:chat_id).last
        message_number = 1
        if last_message 
            message_number = last_message.message_number + 1
        end
        return message_number
    end

   
    def search
        chatID = getChatID(params[:chat_number])
        unless params[:word].blank?
        #   messages = Message.search( params[:word], {chat_id:chatID})
          messages = Message.search( params[:word], {})
          render json: { message: messages }, status: 201

        end
    
    end

    def getChatID(chat_number)
        chat = Chat.where(chat_number:chat_number).where(application_id:current_application.id).select(:id).first
        if chat
            chat.id
        end
        
    end

    
end
