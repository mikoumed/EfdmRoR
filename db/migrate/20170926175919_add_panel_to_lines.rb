class AddPanelToLines < ActiveRecord::Migration[5.0]
  def change
    add_column :lines, :panel, :string
  end
end
