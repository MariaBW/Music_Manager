require("pg")
require_relative("../db/sql_runner")

class Artist
  attr_reader :id, :name

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
  end


  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end


  def catalogue()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    catalogue = SqlRunner.run(sql, values)
    return catalogue.map {|album_hash| Album.new(album_hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  






end
