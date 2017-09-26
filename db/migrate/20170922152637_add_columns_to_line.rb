class AddColumnsToLine < ActiveRecord::Migration[5.0]
  def change
    add_column :lines, :lineName, :string
    add_column :lines, :ticketN, :string
    add_column :lines, :remHS, :text
    add_column :lines, :userHS, :string
    add_column :lines, :remOK, :text
    add_column :lines, :userOK, :string
    add_column :lines, :duration, :time
    add_reference :lines, :user, foreign_key: true
  end
end
