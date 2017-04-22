class RoomsController < ApplicationController
  def show
    @user = User.find(session[:current_user])
    @dialect = Dialect.find(session[:dialect])
  end
end
