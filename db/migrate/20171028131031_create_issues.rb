class CreateIssues < ActiveRecord::Migration[5.0]
    def change
        create_table :issues do |t|

            t.string :title
            t.datetime :start
            t.datetime :end
            t.string :color
            t.references :team, foreign_key: true

            t.timestamps
        end
    end
end
