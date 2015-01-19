class AddGameCodesToGames < ActiveRecord::Migration
  def change
    add_reference :games, :game_codes, index: true
  end
end
