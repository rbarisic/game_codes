class AddGameIdToGameCode < ActiveRecord::Migration
  def change
    add_reference :game_codes, :game, index: true
  end
end
