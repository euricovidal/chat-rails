class ChatGroupsController < ApplicationController
  before_action :set_chat_group, only: %i[ show edit update destroy ]

  def index
    @search = ChatGroup.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @chat_groups = set_page_and_extract_portion_from @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show
    fresh_when etag: @chat_group
  end

  def new
    @chat_group = ChatGroup.new
  end

  def edit
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    @chat_group.save!

    respond_to do |format|
      format.html { redirect_to @chat_group, notice: 'Chat group was successfully created.' }
      format.json { render :show, status: :created }
    end
  end

  def update
    @chat_group.update!(chat_group_params)
    respond_to do |format|
      format.html { redirect_to @chat_group, notice: 'Chat group was successfully updated.' }
      format.json { render :show }
    end
  end

  def destroy
    @chat_group.destroy
    respond_to do |format|
      format.html { redirect_to chat_groups_url, notice: 'Chat group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_chat_group
      @chat_group = ChatGroup.find(params[:id])
    end

    def chat_group_params
      params.require(:chat_group).permit(:name)
    end
end
