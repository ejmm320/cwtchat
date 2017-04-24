class SessionsController < ApplicationController
  def new
    @user_session = UserSession.new
    @sessions = User.active_users
  end

  def create
    @user_session = UserSession.new(params_user_session)
    if @user_session.login_valid?
      if @user_session.already_authenticated?
        flash[:notice] = "User #{@user_session.username} cannot enter because is already logged in using another machine"
        render :new  
      else
        session[:current_user] = @user_session.identity
        session[:dialect] = @user_session.dialect
        @user_session.activate_session
        ActionCable.server.broadcast "room_channel", 
              message: "login", 
              user: @user_session.username, 
              dialect: Dialect.find(@user_session.dialect).icon,
              created_at: Time.now
        redirect_to room_path(Room.first) # We are working with a Single Room, id: 1
      end
    else
      flash[:notice] = "User #{@user_session.username} does not exists"
      render :new
    end
  end

  def destroy
    user = User.find(session[:current_user])
    user.update(active: false)
    ActionCable.server.broadcast "room_channel", 
            message: "logout", 
            user: user.username, 
            dialect: Dialect.find(session[:dialect]).icon,
            created_at: Time.now
    session.clear
    redirect_to root_path
  end

  private

  def params_user_session
    params.require(:user_session).permit(:username, :dialect)
  end
end
