class CreateMiddleAndLongs < ActiveRecord::Migration[7.2]
  def change
    create_table :middle_and_longs do |t|
      t.float :record, null: false
      t.string :pacer
      t.integer :middle_and_long_detail, null: false
      t.references :competition_result, null: false

      t.timestamps
    end
  end
end
