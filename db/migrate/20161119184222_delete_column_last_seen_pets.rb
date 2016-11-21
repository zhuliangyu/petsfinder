class DeleteColumnLastSeenPets < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets,:last_seen

  end
end
