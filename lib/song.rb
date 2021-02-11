class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    newsong = self.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong = self.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = self.new
    newsong.name = name
    newsong.save 
    newsong
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort { |a, b|  a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    filename = filename [0...-4]
    filename = filename.split(" - ")
    newsong = self.new
    newsong.artist_name = filename[0]
    newsong.name = filename[1]
    newsong
  end

  def self.create_from_filename(filename)
    filename = filename [0...-4]
    filename = filename.split(" - ")
    newsong = self.new
    newsong.artist_name = filename[0]
    newsong.name = filename[1]
    newsong.save
  end

  def self.destroy_all
    @@all = []
  end

end



