class AddImageFieldsToGame < ActiveRecord::Migration
  def change
    remove_column :games, :cover_url

    add_column :games, :cover, :string
    add_column :games, :cover_content_type, :string
    add_column :games, :company_image, :string
    add_column :games, :company_image_content_type, :string
  end
end
