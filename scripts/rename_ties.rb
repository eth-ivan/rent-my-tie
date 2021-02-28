require "faker"

images_path = File.expand_path("..", Dir.pwd) + "/app/assets/images/one_hundred_ties"

puts "Renaming files..."

Dir.glob(images_path + "/*").each do |file|
  name = Faker::Artist.name + " " + Faker::Color.color_name
  new_file = images_path + "/" + name + File.extname(file)
  File.rename(file, new_file)
end

puts "Renaming complete."
