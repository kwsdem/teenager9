class AddBlogpublisherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blogpublisher, :boolean, default: false
  end
end

# if current_user.blogpublisher?
  # do something
# end