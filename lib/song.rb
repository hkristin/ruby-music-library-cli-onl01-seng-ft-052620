class Song
  
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name.gsub(".mp3", ""))
    
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap {|song| song.save}
 end
end