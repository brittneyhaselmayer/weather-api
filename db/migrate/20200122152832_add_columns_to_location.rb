class AddColumnsToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :favourite_locations, :area, :string
    add_column :favourite_locations, :state, :string
  end
end
