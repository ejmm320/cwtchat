class MessagesController < ApplicationController
  require 'net/http'

  before_action :set_dialect_info, only: [:create]

  def create
    @message = Message.new(message_params)
    @message.user_id = session[:current_user]
    @message.dialect = @dialect
    uri = URI("#{@dialect.apiurl}?text=#{URI.encode(@message.content)}")
    response = JSON.parse(Net::HTTP.get(uri))
    if response["contents"].nil?
      @message.content_translated = @message.content
    else
      @message.content_translated = response["contents"]["translated"]
    end
    if @message.save
      ActionCable.server.broadcast "room_channel", 
            message: @message.content_translated, 
            user: @message.user.username, 
            dialect: @message.dialect.icon,
            created_at: @message.created_at
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_dialect_info
    @dialect = Dialect.find(session[:dialect])
  end
  
end