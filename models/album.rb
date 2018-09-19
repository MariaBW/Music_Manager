require('pg')
require_relative("../db/sql_runner")

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(details)
    @title = details["title"]
    @genre = details["genre"]
    @id = details["id"].to_i if details["id"]
    @artist_id = details["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def show_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return Artist.new(result[0])
  end
  

end
