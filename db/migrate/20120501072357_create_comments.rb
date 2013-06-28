class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments,{:primary_key => :id} do |t|
      t.integer :photo_id
      t.integer :user_id
      t.datetime :date_time
      t.text :comment
      t.references :pics

      t.timestamps
    end
  end
end
