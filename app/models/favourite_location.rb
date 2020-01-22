class FavouriteLocation < ApplicationRecord
  belongs_to :user
  validates :area, uniqueness: { scope: [:medium, :another_medium] }
end
