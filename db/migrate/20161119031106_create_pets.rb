class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :type
      t.string :breed
      t.string :name
      t.string :sex
      t.string :color
      t.integer :age
      t.string :last_seen
      t.datetime :date_seen
      t.string :note
      t.string :images
      t.boolean :lost
      t.string :location
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
