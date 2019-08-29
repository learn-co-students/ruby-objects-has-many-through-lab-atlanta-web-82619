class Artist
  attr_reader :name

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def genres
    Song.all.collect {|song| song.genre}
  end

  def new_song(name, genre)
    song = Song.new(name, self, genre)
    # song.artist = self
  end

  def self.all
    @@all
  end
end