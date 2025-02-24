class CreateJumpings < ActiveRecord::Migration[7.2]
  def change
    create_table :jumpings do |t|
      t.float :record, null: false
      t.float :wind_speed, null: false
      t.float :approach_distance
      t.integer :jumping_detail, null: false
      t.references :competition_result, null: false

      t.timestamps
    end
  end
end
