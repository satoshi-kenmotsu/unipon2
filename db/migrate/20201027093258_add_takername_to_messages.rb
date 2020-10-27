class AddTakernameToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :takername, :string
  end
end
