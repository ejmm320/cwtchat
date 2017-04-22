class SessionsController < ApplicationController
  def new
    @user_session = UserSession.new
    @sessions = User.active_users
  end

  def create
    @user_session = UserSession.new(params_user_session)
    if @user_session.login_valid?
      session[:current_user] = @user_session.identity
      session[:dialect] = @user_session.dialect
      @user_session.activate_session
      redirect_to room_path(Room.first) # We are working with a Single Room, id: 1
    else
      flash[:notice] = "User #{@user_session.username} does not exists"
      render :new
    end
  end

  def destroy
    UserSession.deactivate_session(session[:current_user])
    session.clear
    redirect_to root_path
  end

  private

  def params_user_session
    params.require(:user_session).permit(:username, :dialect)
  end
end
