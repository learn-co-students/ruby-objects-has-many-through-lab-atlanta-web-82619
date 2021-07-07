
class Genre

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.each {|song| song.genre}
    end

    def artists #has many artists that belog to genre
        genre_artists = []
        Song.all.each do |song|
            if song.genre == self
                genre_artists << song.artist
            end
        end
        genre_artists
    end

end