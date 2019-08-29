class Genre
  attr_accessor  :name
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def artists
    songs.map {|song| song.artist}
  end

  def songs
    Song.all.select {|song| song.genre == self}
  end

  def self.all
    @@all
  end
end