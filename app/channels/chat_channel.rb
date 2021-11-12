class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
    stream_from "chat_#{current_user.id}_channel"

    Rails.logger.info "==========> subscribed"
  end

  def unsubscribed
    Rails.logger.info '==========> unsubscribed'
  end
end
