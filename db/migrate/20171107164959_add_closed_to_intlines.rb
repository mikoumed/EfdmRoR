class AddClosedToIntlines < ActiveRecord::Migration[5.0]
  def change
    add_column :intlines, :closed, :boolean, default: false
  end
end
