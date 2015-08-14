class AddVotesToGameCode < ActiveRecord::Migration
  def change
    add_column :game_codes, :votes, :integer, default: 1
  end
end
