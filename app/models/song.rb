class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :unique_title_for_same_artist_and_year
  validates :released, inclusion: {in: [true, false]}
  validate :valid_release_year
  validates :artist_name, presence: true

  def unique_title_for_same_artist_and_year
    Song.all.each do |song|
      if title == song.title && release_year == song.release_year && artist_name == song.artist_name
        errors[:title] = "cannot have duplicate title by same artist in same year"
      end
    end
  end

  def valid_release_year
    if released && !release_year
      errors[:release_year] = "release year cannot be blank if song has been released"
    elsif released && release_year > DateTime.now.year
      errors[:release_year] = "release year cannot be in the future"
    end
  end
end
