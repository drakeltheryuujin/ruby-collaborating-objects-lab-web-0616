require 'pry'

class Artist

  attr_accessor :name, :songs

  @@song_count = 0
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @@song_count += 1
    @songs << song
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    find = @@all.find { |artist_name| artist_name.name == name }
    find ? find : self.new(name)
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
