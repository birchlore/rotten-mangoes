# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


regular_user = User.create({ email: 'jacksondcuteingham@gmail.com', password_digest: "12345", firstname: "jackson", lastname: "cuteingham", admin: false})
admin_user = User.create({ email: 'jackson@gmail.com', password_digest: "12345", firstname: "jackson", lastname: "cuteingham", admin: false})
