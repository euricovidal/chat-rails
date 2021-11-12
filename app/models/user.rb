class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  enum status: %w[offline away online]

  def set_online!
    update!(status: :online, online_at: Time.current)
    ActionCable.server.broadcast('user_status_channel', { status: :online, user: self })
  end

  def set_offline!
    update!(status: :offline, offline_at: Time.current)
    ActionCable.server.broadcast('user_status_channel', { status: :offline, user: self })
  end
end
