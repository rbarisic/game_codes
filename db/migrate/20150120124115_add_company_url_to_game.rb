class AddCompanyUrlToGame < ActiveRecord::Migration
  def change
    add_column :games, :company_url, :string
  end
end
