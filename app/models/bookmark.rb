class Bookmark < ApplicationRecord
  belongs_to :movie # association to movie model
  belongs_to :list # association to list model
  validates :comment, length: { minimum: 6 } # validation for comment length
  validates :movie, uniqueness: { scope: :list } # validation for uniqueness of the movie so there are no repetitions
end
