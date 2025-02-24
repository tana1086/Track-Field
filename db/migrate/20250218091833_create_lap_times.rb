class CreateLapTimes < ActiveRecord::Migration[7.2]
  def change
    create_table :lap_times do |t|
      t.float :time
      t.integer :distance
      t.references :middle_and_long, null: false

      t.timestamps
    end
  end
end
