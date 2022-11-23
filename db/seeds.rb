# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
User.destroy_all
Movie.destroy_all

# puts"destroying..."

hamza = User.create(first_name: "Hamza", last_name:"Triqui", email:"test@g.com", password:"123456")
hamza.save
puts "destroying..."

require "json"
require "open-uri"

query1 = "blue"
url = "http://www.omdbapi.com/?s=$#{query1}&apikey=d68d3c66"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

address = ["Paris", "Londres", "Lisbonne", "Berlin", "Madrid", "Bordeaux", "Lyon", "Nantes"]
movie_type = ["Comedy", "Drama", "Horror", "SuperHero", "SciFi", "Thriller", "Genre", "Action"]

movies["Search"].each do |movie|
  movie = Movie.new(title: movie["Title"], description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy", poster: movie["Poster"], price: rand(50000..500000), movie_type: movie_type.sample, address: address.sample)
  movie.user = hamza
  movie.save
end

query2 = "sun"
url = "http://www.omdbapi.com/?s=$#{query2}&apikey=d68d3c66"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["Search"].each do |movie|
  movie = Movie.new(title: movie["Title"], description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy", poster: movie["Poster"], price: rand(50000..500000), movie_type: movie_type.sample, address: address.sample)
  movie.user = hamza
  movie.save
end


puts "seed is done"
