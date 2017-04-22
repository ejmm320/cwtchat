class RoomsController < ApplicationController
  def show
    @user = User.find(session[:current_user])
    @dialect = Dialect.find(session[:dialect])
    @messages = Message.all
    @message = Message.new
  end
end
