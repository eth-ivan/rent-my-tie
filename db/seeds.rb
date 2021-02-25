# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning databases..."
Tie.destroy_all
User.destroy_all

puts "Creating users..."

user_1 = { password: "123456", email: "ismael@email.com", profile_image: "user_image/Isamael_ud10oe"}
user_2 = { password: "123456", email: "ivan@email.com", profile_image: "user_image/Ivan_rqmj2o"}
user_3 = { password: "123456", email: "antoine@email.com", profile_image: "user_image/Antoine_q198jo"}

[ user_1, user_2, user_3].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.id}"

end
puts "user Finished!"


puts "Creating ties..."

tie_1 = { user_id: User.first.id, description: "sea  blue stripped tie", price_per_day: 9.99, picture: "ties/pure-silk-sky-blue-black-repp-tie_hsq3b1"}
tie_2 = { user_id: User.first.id, description: "sky blue tie", price_per_day: 5.99, picture: "ties/tie-in-silk-twill_1_izodvv"}
tie_3 = { user_id: User.first.id+1, description: "yellow pee tie", price_per_day: 6.99, picture: "ties/tie-in-silk-twill_2_u1iz3j"}
tie_4 = { user_id: User.first.id+2, description: "black tie", price_per_day: 2.99, picture: "ties/pure-silk-skinny-tie_cc5fp9"}
tie_5 = { user_id: User.first.id+1, description: "tomato red tie", price_per_day: 1.99, picture: "ties/pure-silk-skinny-tie_2_ufiqcn"}
tie_6 = { user_id: User.first.id, description: "steel grey tie", price_per_day: 2.99, picture: "ties/pure-silk-skinny-tie_1_b0v71h"}
tie_7 = { user_id: User.first.id+2, description: "I jut murder my boss red tie", price_per_day: 3.99, picture: "ties/tie-in-silk-twill_t6uoek"}

[ tie_1, tie_2, tie_3, tie_4, tie_5, tie_6, tie_7].each do |attributes|
  tie = Tie.create!(attributes)
  puts "Created #{tie.id}"

end
puts "tie Finished!"

