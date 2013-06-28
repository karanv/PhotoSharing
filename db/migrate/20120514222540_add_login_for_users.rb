class AddLoginForUsers < ActiveRecord::Migration

  def up
    add_column :users, :login, :string
    User.all.each do |u|
      u.update_attribute :login, u.last_name.downcase
    end
    User.reset_column_information
  end
  def down
    remove_column :users,:login
  end
end