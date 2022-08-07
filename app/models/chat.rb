class Chat < ApplicationRecord
    validates :title, presence: true
    validates :application_id, presence: true
    validates :chat_number, presence: true

    def self.setChatCount
        Application.all.each do |application|
            chatsCount = Chat.where(application_id: application.id).count
            application.chats_count = chatsCount
            application.save
        end
    end
end
