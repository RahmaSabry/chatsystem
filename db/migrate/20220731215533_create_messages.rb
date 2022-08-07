class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :message_number
      t.text :body
      t.references :chat
      t.index [:chat_id, :message_number], unique: true
      t.timestamps
    end
    add_foreign_key :messages, :chats, column: :chat_id , on_delete: :cascade, on_update: :cascade
  end
end
