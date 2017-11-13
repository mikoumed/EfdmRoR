class AddClosedToIntequipments < ActiveRecord::Migration[5.0]
  def change
      add_column :intequipments, :closed, :boolean, default: false
  end
end
