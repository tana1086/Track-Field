class CreateSprints < ActiveRecord::Migration[7.2]
  def change
    create_table :sprints do |t|
      t.float :record
      t.float :wind_speed
      t.references :competition_results, null: false, foreign_key: true

      t.timestamps
    end
  end
end
