module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_current_user

      logger.add_tags 'ActionCable', current_user&.name
    end

  def receive(data)
    Rails.logger.info "==========> receive #{data}"
    super(data)
  end

    private

    def find_current_user
      user = User.find_by(id: cookies[:user_id] || request.params[:user_id])
      return user if user

      reject_unathorized_connection
    end
  end
end
