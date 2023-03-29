class AddSessionsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sessions, :text, array: true, default: []
  end
end
