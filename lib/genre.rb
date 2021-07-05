class Genre
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song| song.genre == self}
    end

    def self.all
        @@all
    end

    def artists
        artists = []
        Song.all.map do |song|
            if song.genre == self
                artists << song.artist
            end
        end
        artists
    end
end