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

  def self.deactivate_session(id)
    User.find(id).update(active: false)
  end

  def login_valid?
    User.exists?(username: @username)
  end
  

  def identity
    User.find_by(username: @username).id
  end
  
end
