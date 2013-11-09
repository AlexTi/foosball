class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :forward_player_id
      t.integer :defense_player_id

      t.timestamps
    end
  end
end
