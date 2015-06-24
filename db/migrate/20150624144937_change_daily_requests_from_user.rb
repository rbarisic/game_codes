class ChangeDailyRequestsFromUser < ActiveRecord::Migration
  def change
    change_column :users, :requests_today, :integer, default: 2
  end
end
