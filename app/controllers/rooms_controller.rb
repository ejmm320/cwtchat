class RoomsController < ApplicationController
  def show
    user = User.find(session[:current_user])
    dialect = Dialect.find(session[:dialect])
    render text: "User: #{user.username} who wants to speak in: #{dialect.name}"
  end
end
