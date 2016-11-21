class ChangeColumnLocationToAddressPets < ActiveRecord::Migration[5.0]
  def change
    rename_column :pets, :location, :address

  end
end
