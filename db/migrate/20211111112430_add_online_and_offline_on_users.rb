class AddOnlineAndOfflineOnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status, :int, default: 0
    add_column :users, :online_at, :datetime
    add_column :users, :offline_at, :datetime
  end
end
