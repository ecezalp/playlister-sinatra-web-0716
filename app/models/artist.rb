class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


@@original_name = []

  def slug 
    new_artist = self.name.downcase.split(" ").join("-")
    @@original_name << self.name
    new_artist
  end

  def self.find_by_slug(string)
    unslugged = string.split("-").join(" ")
    true_artist_name = @@original_name.detect {|name| name.downcase == unslugged}
    self.find_by(name: true_artist_name)
  end

end
