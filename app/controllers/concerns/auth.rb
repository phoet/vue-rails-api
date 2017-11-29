module Auth
  def auth_token(user_id)
    Token.encode(user_id: user_id)
  end

  def login(email, password)
    user = User.find_by_email!(email)
    user.authenticate(password)
  end

  def authenticate(token)
    payload = Token.decode(token)
    User.find(payload[:user_id])
  end
end
