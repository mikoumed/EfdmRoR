class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|

      t.timestamps
    end
    add_index :lines, [:user_id, :created_at]
  end
end
