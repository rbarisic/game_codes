class AddCodeLengthToGame < ActiveRecord::Migration
  def change
    add_column :games, :code_length, :integer
  end
end
