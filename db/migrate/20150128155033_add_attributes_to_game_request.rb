class AddAttributesToGameRequest < ActiveRecord::Migration
  def change
    add_column :game_requests, :slug, :string
    add_column :game_requests, :creator, :string
    add_column :game_requests, :cover_url, :string
    add_column :game_requests, :company_url, :string
    add_column :game_requests, :code_length, :string
    add_column :game_requests, :description, :string
  end
end
