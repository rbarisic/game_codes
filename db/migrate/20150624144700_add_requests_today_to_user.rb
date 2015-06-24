class AddRequestsTodayToUser < ActiveRecord::Migration
  def change
    add_column :users, :requests_today, :integer, default: 0
  end
end
