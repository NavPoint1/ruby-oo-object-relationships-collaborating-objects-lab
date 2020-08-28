require 'pry'

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        a = Dir["#{path}/*.mp3"]
        chop_size = path.size + 1
        a.map { |filename|
            filename = filename.reverse
            chop_size.times {
                filename = filename.chop
            }
            filename = filename.reverse
        }
        # binding.pry
    end

    def import
        self.files.each { |filename|
            Song.new_by_filename(filename)
        }
    end

end