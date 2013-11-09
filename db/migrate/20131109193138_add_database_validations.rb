class AddDatabaseValidations < ActiveRecord::Migration
  def change
    change_column :matches, :home_team_id, :intger, null: false
    change_column :matches, :away_team_id, :intger, null: false
    change_column :teams, :forward_player_id, :intger, null: false
    change_column :teams, :defense_player_id, :intger, null: false
  end
end
