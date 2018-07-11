class CreateWorkingTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :working_teams do |t|
        t.string :teamName
        t.string :date
        t.string :session
        t.string :supervisor
        t.text :esaCom
        t.text :esaRadar
        t.references :team, foreign_key: true
        t.timestamps
    end
  end
end
