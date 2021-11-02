class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages, id: :bigint do |t|
      t.text :content, null: false
      t.references :chat_group, foreign_key: true
      t.integer :to_user_id
      t.references :user, null: false, foreign_key: true

      t.timestamps

      t.index :to_user_id
    end
  end
end
