class ChangeColumnNameSightings < ActiveRecord::Migration[5.0]
  def change
    rename_column :sightings, :image, :images

  end
end
