class AddCoverUrlToGame < ActiveRecord::Migration
  def change
    add_column :games, :cover_url, :string
  end
end
