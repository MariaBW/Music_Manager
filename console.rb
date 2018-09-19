require("pry")
require_relative("./models/album")
require_relative("./models/artist")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Mozart"})
artist1.save()


artist2 = Artist.new({"name" => "Vivaldi"})
artist2.save()

album1 = Album.new({
  "title" => "The Marriage of Figaro",
  "genre" => "opera",
  "artist_id" => artist1.id
})
album1.save()

album2 = Album.new({
  "title" => "The Four Seasons",
  "genre" => "seasonal",
  "artist_id" => artist2.id
})
album2.save()

album3 = Album.new({
  "title" => "Eine Kleine Nachtmusik",
  "genre" => "chamber",
  "artist_id" => artist2.id
})
album3.save()








binding.pry

nil
