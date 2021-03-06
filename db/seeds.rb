# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# ------------------------------------------------
# SEED
# ------------------------------------------------
puts "Cleaning databases..."
User.destroy_all
Tie.destroy_all

puts "Creating users..."

file_u1 = URI.open("https://avatars.githubusercontent.com/u/36639655?v=4")
user_1 = User.new(password: "123456", email: "cataline@email.com")
user_1.profile_image.attach(io: file_u1, filename: "cataline", content_type: "image")
user_1.save!

file_u2 = URI.open("https://avatars.githubusercontent.com/u/66406196?v=4")
user_2 = User.new(password: "123456", email: "emmanuel@email.com")
user_2.profile_image.attach(io: file_u2, filename: "emmanuel", content_type: "image")
user_2.save!

file_u3 = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1579007136/c4t3cgynridhyuqvfqwr.jpg")
user_3 = User.new(password: "123456", email: "thibault@email.com")
user_3.profile_image.attach(io: file_u3, filename: "thiebault", content_type: "image")
user_3.save!

file_u4 = URI.open("https://res.cloudinary.com/ivan-perroud/image/upload/v1614866357/xhnm3f8ovqcmujt30rc1.jpg")
user_4 = User.new(password: "123456", email: "ivan@perroud.me")
user_4.profile_image.attach(io: file_u4, filename: "ivan", content_type: "image")
user_4.save!

puts "seed in user db finished!"

# arrays

puts "Creating address..."

require 'open-uri'
require 'nokogiri'

$i = 0
while $i < 10  do
  $i +=1
  url = "https://tel.search.ch/index.fr.html?wo=lausanne&pages= #$i"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  address_array = []

  html_doc.search('.tel-address').each do |element|
    address_array.push(element.text)
    address_array = address_array.uniq
  end
end

puts address_array
puts "Address created!"

puts "Creating ties..."

users = [user_1, user_2, user_3]
prices = [6, 7, 8.5, 9.9, 12, 14.9, 16, 18, 19.9]
desc_1 = "Very nice tie to be well dressed at home during covid! Pair with our new Cabana Stripe black men's dress shirt for a color story no one can resist."
desc_2 = "Handmade of 78% Silk/22% Wool, this tie will suit everyone. Book it now!"
desc_3 = "This Bali Repeat Stripe tie pairs beautifully with our modern-fit oxford shirt in turquoise for a story that is a sure-fire hit all year round"
descriptions = [desc_1, desc_2, desc_3]


# path of images (relative)
images_path = File.expand_path(".", Dir.pwd) + "/app/assets/images/one_hundred_ties"

Dir.glob(images_path + "/*").each do |f|
  filename_wo_extension = File.basename(f, ".jpeg")
  filename = File.basename(f)
  filepath = File.path(f)
  file = File.open(filepath)

  user_id = users.shuffle.first.id
  price = prices.shuffle.first
  description = descriptions.sample
  address = address_array.sample

  tie = Tie.new(user_id: user_id, description: description, price_per_day: price, name: filename_wo_extension, address: address)
  tie.picture.attach(io: file, filename: filename, content_type: "image/jpg")
  tie.save!
end

puts "ties created!"
