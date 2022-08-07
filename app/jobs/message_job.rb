class MessageJob
    include Sidekiq::Job
    
    def perform(body, chat_number)
      chat = Chat.find(chat_number)
      message_number = messageNumber(chat.id)
      message = Message.new
      message.body = body
      message.chat_id = chat.id
      message.message_number = message_number
      message.save
    end
  
    def messageNumber(chat_id)
      last_message = Message.where(chat_id:chat_id).last
      message_number = 1
      if last_message 
          message_number = last_message.message_number + 1
      end
  end
  
  
  end
  