class UserSession
  include ActiveModel::Model
  
  attr_accessor :username, :dialect

  def initialize(attributes = {})
    @username = attributes[:username]
    @dialect = attributes[:dialect]
  end

  def activate_session
    User.find_by(username: @username).update(active: true)
  end

  def login_valid?
    User.exists?(username: @username)
  end

  def already_authenticated?
    User.find_by(username: @username).active
  end
  

  def identity
    User.find_by(username: @username).id
  end
  
end
