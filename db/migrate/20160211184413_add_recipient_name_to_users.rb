class AddRecipientNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recipient_name, :string
    add_column :users, :string, :string
  end
end
