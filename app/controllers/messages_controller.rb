class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  
  ##ここから
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice:'メッセージは保存しました'
  end
  
  private
  def message_params
    params.require(:message).permit(:name,:body)
  end
  #ここまで
end
