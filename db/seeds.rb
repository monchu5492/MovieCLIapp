
10.times do
    Movie.create(title: Faker::Movie.quote, rated: "PG-#{rand(1...20)}", genre: Faker::Music.genre)
end
  
#Faker::Movies::HarryPotter.book






 