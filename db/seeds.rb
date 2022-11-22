# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Movie.destroy_all

# puts"destroying..."

hamza = User.create(first_name: "Hamza", last_name:"Triqui", email:"test@g.com", password:"123456")
hamza.save
puts "destroying..."

require "json"
require "open-uri"

query1 = "sun"
url = "http://www.omdbapi.com/?s=$#{query1}&apikey=d68d3c66"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["Search"].each do |movie|
  movie = Movie.new(title: movie["Title"], description: "none", poster: movie["Poster"], price: rand(1..1000), movie_type: ["Drama", "Comedy", "Superhero"].sample, address: "Paris", release_date: movie["Year"])
  movie.user = hamza
  movie.save
end

puts "seed is done"