class Genre < ActiveRecord::Base
 has_many :song_genres
 has_many :songs, through: :song_genres
 has_many :artists, through: :songs

@@original_name = []

 def slug 
    new_genre = self.name.downcase.split(" ").join("-")
    @@original_name << self.name
    new_genre
  end

  def self.find_by_slug(string)
    unslugged = string.split("-").join(" ")
    true_genre_name = @@original_name.detect {|name| name.downcase == unslugged}
    self.find_by(name: true_genre_name)
  end

end
