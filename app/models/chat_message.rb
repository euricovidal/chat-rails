class ChatMessage < ApplicationRecord
  belongs_to :chat_group, optional: true
  belongs_to :user

  after_create :emit_created

  private

  def emit_created
    ActionCable.server.broadcast(
      'chat_channel',
      {
        from: user.attributes,
        message: content,
        created_at: created_at
      }
    )
  end
end
