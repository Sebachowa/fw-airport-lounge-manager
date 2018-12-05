# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "sebastian.nugnez@gmail.com", password: "seba1984", is_admin: true)


lounge_list = [{
  name: "South",
  price: 10,
  description: "The best place",
  is_legacy: true,
  capacity: 0,
  feed_id: 1
},{
  name: "North",
  price: 14,
  description: "Super cool",
  is_legacy: true,
  capacity: 0,
  feed_id: 77
},{
  name: "Pro",
  price: 13,
  description: "Super cool",
  is_legacy: true,
  capacity: 0,
  feed_id: 24
},{
  name: "Premium",
  price: 20,
  description: "Super cool",
  is_legacy: true,
  capacity: 0,
  feed_id: -5
},{
  name: "International",
  price: 18,
  description: "Super cool",
  is_legacy: true,
  capacity: 0,
  feed_id: 9999
}]

lounge_list.each do |lounge|
  Lounge.create( 
    name: lounge[:name],
    price: lounge[:price],
    description: lounge[:description],
    is_legacy: lounge[:is_legacy],
    capacity: lounge[:capacity],
    feed_id: lounge[:feed_id]
  )
end