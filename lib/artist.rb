class Artist
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def genres
        genres = []
        Song.all.map do |song|
            if song.artist == self
                genres << song.genre
            end
        end
        genres
    end
end