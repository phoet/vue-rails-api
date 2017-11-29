
if User.none?
  User.create!(email: 'phoetmail@googlemail.com' , password: 'xxxxxxxx' , password_confirmation: 'xxxxxxxx')
end

if TimeZone.none?
  name = ActiveSupport::TimeZone.new('Europe/Berlin')
  TimeZone.create!(description: 'My favorite', name: name, user: User.first)
end
