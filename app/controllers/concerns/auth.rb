module Auth
  def auth_token(payload)
    Token.encode(payload)
  end

  def login(email, password)
    return false unless user = User.find_by_email(email)
    user.authenticate(password)
  end

  def authenticate(token)
    payload = Token.decode(token)
    User.find(payload[:user_id])
  end
end
