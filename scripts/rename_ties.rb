require "faker"

images_path = File.expand_path("..", Dir.pwd) + "/app/assets/images/one_hundred_ties"

puts "Renaming files..."

colors = %w[Red Blue Yellow Orange Black White Green Violet Indigo]

Dir.glob(images_path + "/*").each do |file|
  name = Faker::Artist.name + " " + colors.shuffle.first
  new_file = images_path + "/" + name + File.extname(file)
  File.rename(file, new_file)
end

puts "Renaming complete."
