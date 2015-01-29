class CreateGameRequests < ActiveRecord::Migration
  def change
    create_table :game_requests do |t|
      t.string :name
      t.boolean :accepted
      t.integer :requests, default: 1

      t.timestamps
    end
    add_index :game_requests, :name, unique: true
  end
end