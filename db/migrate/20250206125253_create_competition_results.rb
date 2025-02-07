class CreateCompetitionResults < ActiveRecord::Migration[7.2]
  def change
    create_table :competition_results do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :venue
      t.date :date, null: false
      t.text :memo

      t.timestamps
    end
  end
end
