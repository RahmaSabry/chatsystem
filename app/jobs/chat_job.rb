class ChatJob
  include Sidekiq::Job
  # include Sidekiq::Worker
  # include Sidekiq::Status::Worker 
  def perform(title, application_id)
    chat_number = chatNumber(application_id)
        chat = Chat.new
        chat.title = title
        chat.application_id = application_id
        chat.chat_number = chat_number
        chat.save
        # chat_number = retrieve :chat_number
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
