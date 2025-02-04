class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :icon
      t.string :areas
      t.string :event
      t.float :goal
      t.text :self_introduction

      t.timestamps
    end
  end
end
