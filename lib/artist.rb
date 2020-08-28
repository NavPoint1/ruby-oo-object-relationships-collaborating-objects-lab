class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select { |song|
            song.artist == self
        }
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        self.songs.each { |song|
            puts song.name
        }
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        found_artist = self.all.find { |artist|
            artist.name == name
        }
        if !found_artist
            found_artist = Artist.new(name)
        end
        return found_artist
    end

end