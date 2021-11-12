class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'user_status_channel'

    Rails.logger.info '==========> subscribed'

    current_user.set_online!
  end

  def unsubscribed
    current_user.set_offline!
    Rails.logger.info '==========> unsubscribed'
  end
end
