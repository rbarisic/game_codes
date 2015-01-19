class DefaultAdminToFalseForUsers < ActiveRecord::Migration
  def change
  	change_column :users, :admin, :string, default: false
  end
end