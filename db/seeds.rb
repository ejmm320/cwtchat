# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a dialect
dialect1 = Dialect.create({name: 'Yoda', apiurl: 'http://api.funtranslations.com/translate/yoda.json', icon: 'yoda.png' })
dialect2 = Dialect.create({name: 'Klingon', apiurl: 'http://api.funtranslations.com/translate/klingon.json', icon: 'klingon.png' })
dialect3 = Dialect.create({name: 'Minion', apiurl: 'http://api.funtranslations.com/translate/minion.json', icon: 'minion.png' })

# Create 4 users whom speaks random dialects
1.upto(4) do |i|
  User.create({username: "ecratum#{i}", dialect_id: eval("dialect#{rand(1..3)}.id"), active: false})
end

# Create a room to show chat
Room.create(title: 'room_channel_1', subject: 'Lorem ipsum...')