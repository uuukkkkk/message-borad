class MessagesController < ApplicationController
  before_action :set_message,only: [:edit, :update, :destroy]
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
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice:'メッセージを削除しました'
  end
  
  private
  def message_params
    params.require(:message).permit(:name,:body,:age)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  #ここまで
end
