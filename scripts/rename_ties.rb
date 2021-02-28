puts "Renaming files..."

folder_path = "/Users/ivanperroud/code/eth-ivan/rent-my-tie/app/assets/images/one_hundred_ties"
Dir.glob(folder_path + "/*").sort.each_with_index do |f, index|
  filename = File.basename(f, File.extname(f))
  new_filename = "tie" + index.to_s
  File.rename(f, folder_path + "/" + new_filename + File.extname(f))
  puts new_filename
end

puts "Renaming complete."
