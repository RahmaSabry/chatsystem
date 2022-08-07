class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :chat_number
      t.string :title
      t.integer :messages_count ,default: 0
      t.references :application
      t.index [:application_id, :chat_number], unique: true
      t.timestamps
    end
    add_foreign_key :chats, :applications, column: :application_id , on_delete: :cascade, on_update: :cascade
    # add_index "unique_chat_number", ["chat_number", "application_id"], :unique => true
  end
end
