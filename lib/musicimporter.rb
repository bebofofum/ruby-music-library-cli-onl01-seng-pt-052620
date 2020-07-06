class MusicImporter

  attr_accessor :path, :files

  extend Concerns::Findable

  def initialize(path)
    @path = path

  end

# Dir.entries is a method that returns an array containing all filenames in given directory
  def files
    Dir.entries("#{path}").filter! {|file| file.include?(".mp3")}
  end

  def import
    self.files.collect {|file| Song.create_from_filename(file)}
  end


end