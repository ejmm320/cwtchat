class SessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params_user_session)
    if @user_session.login_valid?
      session[:current_user] = @user_session.identity
      session[:dialect] = @user_session.dialect
      redirect_to room_path(Room.first) # We are working with a single room
    else
      flash[:notice] = "User #{@user_session.username} does not exists"
      render :new
    end
  end

  def destroy
  end

  private

  def params_user_session
    params.require(:user_session).permit(:username, :dialect)
  end
end
