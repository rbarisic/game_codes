class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.references :user, index: true
      t.references :code, index: true

      t.timestamps
    end
  end
end
