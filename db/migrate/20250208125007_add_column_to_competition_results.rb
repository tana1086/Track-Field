class AddColumnToCompetitionResults < ActiveRecord::Migration[7.2]
  def change
    add_column :competition_results, :event_type, :integer, default: 0
  end
end
