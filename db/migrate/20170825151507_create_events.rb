class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :content
      t.string :object
      t.string :user
      t.string :panel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
