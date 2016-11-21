class AddColumnsAdressToSightings < ActiveRecord::Migration[5.0]
  def change
    add_column :sightings, :address, :string
    add_column :sightings, :longitude, :float
    add_column :sightings, :latitude, :float


  end
end
