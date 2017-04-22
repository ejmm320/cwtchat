class MessagesController < ApplicationController

  before_action :set_dialect_info, only: [:create]

  def create
    @message = Message.new(message_params)
    @message.user_id = session[:current_user]
    @message.dialect = @dialect
    render text: "Usuario: #{@message.user_id}, Mensaje: #{@message.content}, Dialecto: #{@dialect.apiurl}"
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