class MessagesController < ApplicationController
  require 'net/http'

  before_action :set_dialect_info, only: [:create]

  def create
    @message = Message.new(message_params)
    @message.user_id = session[:current_user]
    @message.dialect = @dialect
    #uri = URI("#{@dialect.apiurl}?text=#{URI.encode(@message.content)}")
    #response = JSON.parse(Net::HTTP.get(uri))
    #@message.content_translated = response["contents"]["translated"]
    @message.content_translated = @message.content
    if @message.save
      ActionCable.server.broadcast "room_channel", message: @message.content_translated
    end
    #render text: "Usuario: #{@message.user_id}, Mensaje: #{response["contents"]["translated"]}, Dialecto: #{@dialect.apiurl}"
    #@message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_dialect_info
    @dialect = Dialect.find(session[:dialect])
  end
  
end