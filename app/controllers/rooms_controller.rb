class RoomsController < ApplicationController
  before_action :check_permissions, only: [:show]

  def show
    @messages = Message.all
    @message = Message.new
  end

  private

  def check_permissions
    if session[:current_user].nil?
      session.clear
      redirect_to new_session_path, notice: 'You have to ve authenticated first to enter the Room'
    else
      @user = User.find(session[:current_user])
      @dialect = Dialect.find(session[:dialect])
    end
  end

end
