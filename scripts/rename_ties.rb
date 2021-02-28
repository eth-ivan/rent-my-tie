require "faker"
folder_path = "/Users/ivanperroud/code/eth-ivan/rent-my-tie/app/assets/images/one_hundred_ties"

puts "Renaming files..."

Dir.glob(folder_path + "/*").each do |file|
  name = Faker::Artist.name + " " + Faker::Color.color_name
  new_file = folder_path + "/" + name + File.extname(file)
  File.rename(file, new_file)
end

puts "Renaming complete."
