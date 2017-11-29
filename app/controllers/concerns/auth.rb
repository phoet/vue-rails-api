module Auth
  # def call(user_id)
    # JsonWebToken.encode(user_id: user_id)

  def login!(email, password)
    user = User.find_by_email!(email)
    user.authenticate!(password)
    user
  end

  def authenticate!(headers)
    auth_header = headers['Authorization'].split(' ')
    token = JsonWebToken.decode(auth_header)
    User.find!(token[:user_id])
  end
end
