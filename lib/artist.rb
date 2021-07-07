
#The Artist class needs a class variable @@all that begins as an empty array
#The Artist class needs a class method .all that lists each artist in the class variable
#An artist is initialized with a name and is saved in the @@all array.
#new_song, that takes in an argument of a name and genre creates a new song. That song should know that it belongs to the artist.
#songs, that iterates through all songs and finds the songs that belong to that artist. Try using select to achieve this.
#genres that iterates over that artist's songs and collects the genre of each song.

class Artist

    attr_accessor :name, :genre

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def songs #returs all songs associated with artist
        Song.all.select {|song| song.artist == self}
    end

    def genres
        artist_genres = []
        Song.all.each do |song| 
            if song.artist == self
                artist_genres << song.genre
            end
        end
        artist_genres
    end

end