
if User.none?
  User.create!(email: 'phoetmail@googlemail.com', name: 'Peter', password: 'xxxxxxxx' , password_confirmation: 'xxxxxxxx', role: :admin)
end

if TimeZone.none?
  name = 'Europe/Berlin'
  TimeZone.create!(description: 'My favorite', name: name, user: User.first)
end
