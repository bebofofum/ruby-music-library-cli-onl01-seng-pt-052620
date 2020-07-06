class Song

  attr_accessor :name, :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name = '', artist = '', genre = '')
    @name = name
    @artist = artist
    @genre = genre
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    # split returns an array. delete_suffix deletes ending characters defined in ()
    split_name = filename.delete_suffix(".mp3").split(" - ")
    song = Song.new(split_name[1])
    artist = Artist.find_or_create_by_name(split_name[0]) 
    genre = Genre.find_or_create_by_name(split_name[2])
    song.artist = artist
    song.genre = genre
    song 
    # binding.pry
end 

def self.create_from_filename(filename)
  # calls class method new_from_filename passing in filename string creating a Song instance. Calling .save instance method to push into @@all array.
  song_listing = self.new_from_filename(filename).save
end


  def save
    @@all << self
  end



end