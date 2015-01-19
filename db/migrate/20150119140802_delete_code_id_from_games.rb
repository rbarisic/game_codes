class DeleteCodeIdFromGames < ActiveRecord::Migration
  def change
  	remove_column :games, :code_id
  end
end
