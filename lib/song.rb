class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = nil
        @@all << self
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.new_by_filename(filename)
        4.times {
            filename = filename.chop
        }
        split = filename.split(" - ")

        artist_name = split[0]
        name = split[1]
        genre = split[2]

        song = Song.new(name)
        song.artist_name = artist_name

        return song
    end

    def self.all
        @@all
    end

end