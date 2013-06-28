class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, {:primary_key => :id} do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end