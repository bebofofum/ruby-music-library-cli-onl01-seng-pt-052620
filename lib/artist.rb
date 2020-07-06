
class Artist

  attr_accessor :name, :genre

  extend Concerns::Findable


  @@all = []

  def initialize(name)
    @name = name
    # save
  end


  def self.all
    @@all
  end

  def save
    @@all << self
  end


  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == "" 
      song.artist = self
    end
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end

end