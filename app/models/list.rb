class List < ApplicationRecord
  has_many :bookmarks # association to model Bookmark
  has_many :movies, through: :bookmarks, dependent: :destroy # association to model Movie
  validates :name, presence: true, uniqueness: true # validates that name is present
  has_one_attached :photo # part of the cloudinary set up so the user can use their own picture for the list cover
end
