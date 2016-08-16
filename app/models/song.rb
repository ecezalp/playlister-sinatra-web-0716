class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  @@original_name = []

  def slug 
    new_song = self.name.downcase.split(" ").join("-")
    @@original_name << self.name
    new_song
  end

  def self.find_by_slug(string)
    unslugged = string.split("-").join(" ")
    true_song_name = @@original_name.detect {|name| name.downcase == unslugged}
    self.find_by(name: true_song_name)
  end


end
