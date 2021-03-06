# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# ------------------------------------------------
# SEED 1
# ------------------------------------------------
# # require "open-uri"

# puts "Cleaning databases..."
# Tie.destroy_all
# User.destroy_all

# puts "Creating users..."

# file_u1 = URI.open("https://avatars.githubusercontent.com/u/36639655?v=4")
# user_1 = User.new(password: "123456", email: "cataline@email.com")
# user_1.profile_image.attach(io: file_u1, filename: "cataline", content_type: "image")
# user_1.save!

# file_u2 = URI.open("https://avatars.githubusercontent.com/u/66406196?v=4")
# user_2 = User.new(password: "123456", email: "emmanuel@email.com")
# user_2.profile_image.attach(io: file_u2, filename: "emmanuel", content_type: "image")
# user_2.save!

# file_u3 = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1579007136/c4t3cgynridhyuqvfqwr.jpg")
# user_3 = User.new(password: "123456", email: "thibault@email.com")
# user_3.profile_image.attach(io: file_u3, filename: "thiebault", content_type: "image")
# user_3.save!
# puts "seed in user db finished!"

# puts "Creating ties..."

# file_t1 = URI.open("https://www.loding.fr/che/994-home_default/pure-silk-skinny-tie.jpg")
# tie_1 = Tie.new(user_id: User.first.id, description: "The Trump tie", price_per_day: 9.99, name: "Red Trump")
# tie_1.picture.attach(io: file_t1, filename: "red_tomato.jpg", content_type: "image/jpg")
# tie_1.save!

# file_t2 = URI.open("https://www.loding.fr/che/990-home_default/pure-silk-skinny-tie.jpg")
# tie_2 = Tie.new(user_id: User.first.id + 1, description: "no charactere grey tie", price_per_day: 9.99, name: "The Grey")
# tie_2.picture.attach(io: file_t2, filename: "steal_grey.jpg", content_type: "image/jpg")
# tie_2.save!

# file_t3 = URI.open("https://www.loding.fr/che/993-home_default/pure-silk-skinny-tie.jpg")
# tie_3 = Tie.new(user_id: User.first.id + 1, description: "killer tie", price_per_day: 9.99, name: "Killer")
# tie_3.picture.attach(io: file_t3, filename: "black.jpg", content_type: "image/jpg")
# tie_3.save!

# file_t4 = URI.open("https://www.loding.fr/che/1081-home_default/tie-in-silk-twill.jpg")
# tie_4 = Tie.new(user_id: User.first.id + 2, description: "MY wife cheeted on me tie", price_per_day: 9.99, name: "The wife")
# tie_4.picture.attach(io: file_t4, filename: "yellow.jpg", content_type: "image/jpg")
# tie_4.save!

# puts "seed in ties db finished!"

# ------------------------------------------------
# SEED 2
# ------------------------------------------------
puts "Cleaning databases..."
User.destroy_all

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
puts "Creating ties..."

# arrays
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
  description = descriptions.shuffle.first

  tie = Tie.new(user_id: user_id, description: description, price_per_day: price, name: filename_wo_extension)
  tie.picture.attach(io: file, filename: filename, content_type: "image/jpg")
  tie.save!
end

puts "ties created!"
