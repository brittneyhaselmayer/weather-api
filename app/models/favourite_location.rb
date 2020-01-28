class FavouriteLocation < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => [:area, :state]
end
