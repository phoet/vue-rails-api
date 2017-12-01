
if User.none?
  User.create!(email: 'phoetmail@googlemail.com', name: 'Peter', password: 'xxxxxxxx' , password_confirmation: 'xxxxxxxx', role: :admin)
end

if TimeZone.none?
  TimeZone.create!(name: 'My favorite', key: 'Europe/Berlin', user: User.first)
end
