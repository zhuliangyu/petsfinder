class CreateSightings < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.string :type
      t.string :last_seen
      t.datetime :date_seen
      t.string :note
      t.string :image
      t.string :contact

      t.timestamps
    end
  end
end
