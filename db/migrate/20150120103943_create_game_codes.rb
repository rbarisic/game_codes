class CreateGameCodes < ActiveRecord::Migration
  def change
    create_table :game_codes do |t|
      t.string :code
      t.references :user, index: true

      t.timestamps
    end
    add_index :game_codes, :code, unique: true
  end
end
