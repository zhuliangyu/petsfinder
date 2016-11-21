class DeleteColumnLastSeenSighting < ActiveRecord::Migration[5.0]
  def change
    remove_column :sightings, :last_seen

  end
end
