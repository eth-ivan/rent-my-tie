require "faker"
folder_path = "/Users/ivanperroud/code/eth-ivan/rent-my-tie/app/assets/images/one_hundred_ties"

puts "Renaming files..."

Dir.glob(folder_path + "/*").each do |file|
  new_filename = Faker::Beer.hop
  File.rename(file, folder_path + "/" + new_filename + File.extname(file))
  puts new_filename
end

puts "Renaming complete."
