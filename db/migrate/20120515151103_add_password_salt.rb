class AddPasswordSalt < ActiveRecord::Migration
  def up
    add_column :users, :password_digest, :string
    add_column :users, :salt, :string
     # User.all.each do |u|
     #       u.update_attribute :salt, rand.to_s
     #     end
     #     User.all.each do |u|
     #       passwordString = u.login + u.salt
     #       u.update_attribute :password_digest, hexdigest(passwordString)
     #     end
    User.reset_column_information
  end
  def down
    remove_column :users,:password_digest
    remove_column :users,:salt
  end
end