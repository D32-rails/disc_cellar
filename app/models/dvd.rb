class Dvd < ActiveRecord::Base
  validates :title, length: { in: 3..30, too_short: ": That's too short!" }
  validates :year, presence: true
  validates :genre, presence: true

  has_and_belongs_to_many :users
end
