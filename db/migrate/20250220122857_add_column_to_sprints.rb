class AddColumnToSprints < ActiveRecord::Migration[7.2]
  def change
      add_column :sprints, :sprint_detail, :integer, null: false
  end
end
