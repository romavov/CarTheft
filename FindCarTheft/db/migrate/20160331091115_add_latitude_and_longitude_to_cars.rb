class AddLatitudeAndLongitudeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :latitude, :string
    add_column :cars, :longitude, :string
  end
end
