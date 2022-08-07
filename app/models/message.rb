class Message < ApplicationRecord
    include Searchable
    validates :body, presence: true
    validates :chat_id, presence: true
    validates :message_number, presence: true

    def self.setMessageCount
        Chat.all.each do |chat|
            messagesCount = Message.where(chat_id: chat.id).count
            chat.messages_count = messagesCount
            chat.save
        end
    end
end
