class User < ApplicationRecord
    has_many :favourite_locations
    validates :username, presence: true
    validates :password, presence: true
    validates_uniqueness_of :user_id, :area, :state, on: :create
end
