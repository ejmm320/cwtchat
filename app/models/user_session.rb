class UserSession
  include ActiveModel::Model
  
  attr_accessor :username, :dialect

  def initialize(attributes = {})
    @username = attributes[:username]
    @dialect = attributes[:dialect]
  end

  def login_valid?
    User.exists?(username: @username)
  end
  

  def identity
    User.find_by(username: @username).id
  end
  
end
