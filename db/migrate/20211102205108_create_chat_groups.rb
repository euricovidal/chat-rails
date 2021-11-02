class CreateChatGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_groups do |t|
      t.string :name, null: false

      t.timestamps

      t.index :name, unique: true
    end
  end
end
