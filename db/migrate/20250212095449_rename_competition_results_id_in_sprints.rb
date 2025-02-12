class RenameCompetitionResultsIdInSprints < ActiveRecord::Migration[7.2]
  def change
    rename_column :sprints, :competition_results_id, :competition_result_id
  end
end
