class MessagesController < ApplicationController
  def index
    # Messageを全て取得する
    @messages = Message.all
    @message = Message.new
  end
  
  ##ここから
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice:'メッセージは保存しました'
    else
      #メッセージを保存出来なかった場合
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name,:body)
  end
  #ここまで
end
