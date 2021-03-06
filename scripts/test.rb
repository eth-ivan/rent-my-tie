require "open-uri"
require "nokogiri"

address_array = []

for i in 0..15
  puts i
  url = "https://tel.search.ch/index.fr.html?wo=lausanne&pages=#{i}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(".tel-address").each do |element|
    address_array.push(element.text)
  end
end

address_array = address_array.uniq
puts address_array.size
