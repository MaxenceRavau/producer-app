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

address = ["Paris", "Londres", "Lisbonne", "Berlin", "Madrid", "Bordeaux", "Lyon", "Nantes"]
movie_type = ["Comedy", "Drama", "Horror", "SuperHero", "SciFi", "Thriller", "Genre", "Action"]
movie_synopsis = [
  "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods--and imprisoned just as quickly--Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
  "Follows Ember and Wade, in a city where fire-, water-, land- and air-residents live together.",
  "Following a betrayal, a young man left for the dead is reborn as a powerful devil-human hybrid after merging with his pet devil and is soon enlisted into an organization dedicated to hunting devils.",
  "It involves culture of Kambla and Bhootha Kola. A human and nature conflict where Shiva is a rebel who defends his village and nature. A death leads to war between villagers and evil forces. Will he able to regain peace in the village?",
  "After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.",
  "Three friends take a trek to the Everest Base Camp. A simple trek turns out to be a personal, emotional and spiritual journey as they battle their physical limitations and discover the true meaning of freedom.",
  "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
  "A different way we can live better for longer: regenerating damage, maximizing strength, building resilience, shocking the body, supercharging memory and confronting mortality.",
  "Follows the adventures of Monkey D. Luffy and his pirate crew in order to find the greatest treasure ever left by the legendary Pirate, Gold Roger. The famous mystery treasure named",
  "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe",
  "A reclusive romance novelist on a book tour with her cover model gets swept up in a kidnapping attempt that lands them both in a cutthroat jungle adventure",
  "After being struck by lightning, Barry Allen wakes up from his coma to discover he's been given the power of super speed, becoming the Flash, and fighting crime in Central City.",
  "A different way we can live better for longer: regenerating damage, maximizing strength, building resilience, shocking the body, supercharging memory and confronting mortality.",
  "Street-smart Nathan Drake is recruited by seasoned treasure hunter Victor Sully Sullivan to recover a fortune amassed by Ferdinand Magellan, and lost 500 years ago by the House of Moncada.",
  "In a time of conflict, a group of unlikely heroes band together on a mission to steal the plans to the Death Star, the Empire's ultimate weapon of destruction.",
  "A reclusive romance novelist on a book tour with her cover model gets swept up in a kidnapping attempt that lands them both in a cutthroat jungle adventure",
]

query1 = "blue"
url = "http://www.omdbapi.com/?s=$#{query1}&apikey=d68d3c66"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["Search"].each do |movie|
  movie = Movie.new(title: movie["Title"], description: movie_synopsis.sample, poster: movie["Poster"], price: rand(250..2500).ceil(-1), movie_type: movie_type.sample, address: address.sample)
  movie.user = hamza
  movie.save
end

query2 = "sun"
url = "http://www.omdbapi.com/?s=$#{query2}&apikey=d68d3c66"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["Search"].each do |movie|
  movie = Movie.new(title: movie["Title"], description: movie_synopsis.sample, poster: movie["Poster"], price: rand(250..2500).ceil(-1), movie_type: movie_type.sample, address: address.sample)
  movie.user = hamza
  movie.save
end


puts "seed is done"
