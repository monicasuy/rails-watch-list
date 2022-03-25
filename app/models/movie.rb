class Movie < ApplicationRecord
  has_many :lists, through: :bookmarks # association to List Model through the Bookmark model
  has_many :bookmarks # association to Bookmark model
  validates :title, presence: true, uniqueness: true # checks that title is present
  validates :overview, presence: true # checks that overview is present
end
