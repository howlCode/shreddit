class AddNickToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nick, :string
  end
end
