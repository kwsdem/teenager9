class AddAgesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ages, :datetime
  end
end
