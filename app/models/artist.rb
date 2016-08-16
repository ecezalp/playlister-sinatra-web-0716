class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug 
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(string)
    unslugged = string.split("-").collect {|x| x.capitalize}.join(" ")
    self.find_by(name: unslugged)
  end

end
