class CreateThrowings < ActiveRecord::Migration[7.2]
  def change
    create_table :throwings do |t|
      t.float :record, null: false
      t.float :approach_distance
      t.integer :throwing_detail, null: false
      t.references :competition_result, null: false

      t.timestamps
    end
  end
end
