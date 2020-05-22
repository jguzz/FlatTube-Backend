require "rest-client"
require "byebug"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.destroy_all
Video.destroy_all


key = ENV["API_KEY"]
res = RestClient.get("https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=50&regionCode=US&key=#{key}")
data = JSON.parse(res)
videos=data["items"]

i = 0
while i < 50 do
    video = Video.create(title:videos[i]["snippet"]["title"], videoURL:videos[i]["player"]["embedHtml"], description:videos[i]["snippet"]["description"], 
        channelTitle:videos[i]["snippet"]["channelTitle"], views:videos[i]["statistics"]["viewCount"], commentCount:videos[i]["statistics"]["commentCount"], 
        uploadDate:videos[i]["snippet"]["publishedAt"], thumbnailURL:videos[i]["snippet"]["thumbnails"]["default"])
    if videos[i]["snippet"]["tags"] != nil
        videos[i]["snippet"]["tags"].map{|tag| Tag.create(video_id:video.id, tag: tag)}
    end
    i = i+1
end
puts "seeding data"