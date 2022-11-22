# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Movie.destroy_all
puts"destroying..."

hamza = User.create(first_name: "Hamza", last_name:"Triqui", email:"test@g.com", password:"123456")
movie1 = Movie.create(title: "Hamza", release_date: 1994, description: "test", poster: "img", price: 1000, movie_type: "Drama", address: "Paris 11")
movie1.user = hamza
movie1.save

titanic = Movie.create(title: "titanic", release_date: 1994, description: "test", poster: "img", price: 1000, movie_type: "Drama", address: "Paris 11")
titanic.user = hamza
titanic.save

indiana = Movie.create(title: "indiana", release_date: 1994, description: "test", poster: "img", price: 1000, movie_type: "Drama", address: "Paris 11")
indiana.user = hamza
indiana.save

tarzan = Movie.create(title: "tarzan", release_date: 1994, description: "test", poster: "img", price: 1000, movie_type: "Drama", address: "Paris 11")
tarzan.user = hamza
tarzan.save

jungle = Movie.create(title: "jungle", release_date: 1994, description: "test", poster: "img", price: 1000, movie_type: "Drama", address: "Paris 11")
jungle.user = hamza
jungle.save

twilight = Movie.create(title: "twilight", release_date: 1994, description: "test", poster: "img", price: 1000, movie_type: "Drama", address: "Paris 11")
twilight.user = hamza
twilight.save



puts "seed is done"
# Movie.create([title: "Hamza"])
# user = User.create(first_name: "test", last_name:"Triqui", email:"test@g.com", password:"123456")
# movie2 = Movie.new(title: "movie 2", release_date: 1994, description: "test", poster: "img", price: 1000, movie_type: "Drama", address: "Paris 11")
# movie2.user = user
# movie2.save
