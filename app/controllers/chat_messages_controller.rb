class ChatMessagesController < ApplicationController
  def group
    @group = ChatGroup.find(params[:id])
  end

  def create
    ChatMessage.create!(user: current_user, **chat_params)
  end

  private

  def chat_params
    params.require(:chat_message).permit(:content)
  end
end
