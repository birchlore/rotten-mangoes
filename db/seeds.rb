# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


regular_user = User.create({ email: 'notadmin@gmail.com', password: "12345", password_confirmation: "12345", firstname: "jackson", lastname: "cuteingham", admin: false})
if !regular_user.valid?
  raise "Could not create regular user: #{regular_user.errors.full_messages}"
end

admin_user = User.create({ email: 'admin@gmail.com', password: "12345", password_confirmation: "12345", firstname: "jackson", lastname: "cuteingham", admin: true})
if !admin_user.valid?
  raise "Could not create admin user: #{admin_user.errors.full_messages}"
end