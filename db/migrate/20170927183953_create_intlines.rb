class CreateIntlines < ActiveRecord::Migration[5.0]
  def change
    create_table :intlines do |t|
      t.string :lineName
      t.string :ticketN
      t.text :remHS
      t.string :userHS
      t.text :remOK
      t.string :userOK
      t.time :duration
      t.string :panel
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
