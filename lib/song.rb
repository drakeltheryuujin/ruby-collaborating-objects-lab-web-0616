class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    file = filename.split(" - ")
    artist = file[0]
    song_title = file[1]
    song = self.new(song_title)
    song.artist_name = artist
    song
  end

end
