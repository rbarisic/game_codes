class AddCreatorToGames < ActiveRecord::Migration
  def change
    add_column :games, :creator, :string
  end
end
