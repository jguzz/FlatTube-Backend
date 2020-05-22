require "rest-client"
require "byebug"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'uri'


key = ENV["API_KEY"]
res = RestClient.get("https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&key=#{key}")
data = JSON.parse(res)
video = data[0]
data.each do |obj| 
	obj.each do |key, val|
		if key === "snippet"
			key.each do |snipKey, snipId|
				if snipKey
			end
		end
	end
end
# puts "#{data[0]["snippet"]}"
puts data["items"]