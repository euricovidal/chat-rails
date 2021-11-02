class ChatMessage < ApplicationRecord
  belongs_to :chat_group, optional: true
  belongs_to :user
end
