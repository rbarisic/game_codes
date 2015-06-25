class AddCoinMultiplierToGames < ActiveRecord::Migration
  def change
    add_column :games, :coin_multiplier, :integer, default: 1
  end
end
