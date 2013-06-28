class SetDefaultPassword < ActiveRecord::Migration
  def up
     User.all.each do |user|
        user.update_attributes!(:password => user.first_name.downcase)
     end
     User.reset_column_information
   end

   def down
     User.all.each do |user|
        user.update_attributes!(:salt => nil)
        user.update_attributes!(:password_digest => nil)
     end
     User.reset_column_information
   end
end

