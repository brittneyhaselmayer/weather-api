class AddCoordinateToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :favourite_locations, :latitude, :float
    add_column :favourite_locations, :longitude, :float
  end
end
