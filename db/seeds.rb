puts 'Creating Admin User...'
user = User.new
user.email = 'admin@gmail.com'
user.password = 'admin1234'
user.is_admin = true
user.save!

puts 'Admin user created'
puts '-----------------------------'

lounge_list = [{
  name: 'South',
  price: 10,
  description: 'The best place',
  is_legacy: true,
  capacity: 0,
  feed_id: 1
},{
  name: 'North',
  price: 14,
  description: 'Super cool',
  is_legacy: true,
  capacity: 0,
  feed_id: 77
},{
  name: 'Pro',
  price: 13,
  description: 'Super cool',
  is_legacy: true,
  capacity: 0,
  feed_id: 24
},{
  name: 'Premium',
  price: 20,
  description: 'Super cool',
  is_legacy: true,
  capacity: 0,
  feed_id: -5
},{
  name: 'International',
  price: 18,
  description: 'Super cool',
  is_legacy: true,
  capacity: 0,
  feed_id: 9999
}]

service_list = [{
  name: 'Meeting room',
  price: 5,
  picture: 'https://www.citizenm.com/cache/images/citizenm_schipol_2-0199_web_00ecec985a24cc.jpg'
}, {
  name: 'Gim',
  price: 8,
  picture: 'https://www.advanceflooringsystems.com/images/600x400/products/Premium-Gym-Tiles.jpg'
}, {
  name: 'Spa',
  price: 12,
  picture: 'https://g4l-images.imgix.net/55b20956e4b06127f572719b/3cad01fd42bf8cffce33c0b386aa9873'
}]

puts 'Creating Extra Services ...'

service_list.each do |service|
  new_service = Service.new
  new_service.name = service[:name]
  new_service.price = service[:price]
  new_service.picture = service[:picture]
  new_service.save!
end

puts 'Extra Services created'
puts '-----------------------------'
services = Service.all

puts 'Creating Lounges ...'

lounge_list.each do |lounge|
  new_lounge = Lounge.create({
    name: lounge[:name],
    price: lounge[:price],
    description: lounge[:description],
    is_legacy: lounge[:is_legacy],
    capacity: lounge[:capacity],
    feed_id: lounge[:feed_id]
  })
  services.each do |service|
    LoungeService.create( { service_id: service[:id], lounge_id: new_lounge[:id] } )
  end
end

puts '-----------------------------'
puts 'Lounges created'
puts '-----------------------------'
puts 'Seeding finished!'

