require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(new_name)
    song = Song.new
    song.name = new_name
    song
  end

  def self.create_by_name(new_name)
    song = Song.create
    song.name = new_name
    song
  end

  def self.find_by_name(song_name)

    self.all.find { |song| song.name == song_name} 
  
  end

  def self.find_or_create_by_name(song_name)
    
    if self.find_by_name(song_name) == nil 
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end

  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    strings = filename.split(" - ")
    artist = strings[0]
    title = strings[1].chomp(".mp3")

    song = Song.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    strings = filename.split(" - ")
    artist = strings[0]
    title = strings[1].chomp(".mp3")

    song = Song.create
    song.name = title
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end




end
