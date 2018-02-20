class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name=(title)
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    @@all << song
    song
  end

  def self.find_by_name(string)
    self.all.detect {|i| i.name == string}
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) ? self.find_by_name(string) : self.create_by_name(string)
  end

  def self.alphabetical
    self.all.sort_by { |word| word.name }
  end
end
