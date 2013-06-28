class CreatePhotos < ActiveRecord::Migration
  def up 
    create_table :photos, {:primary_key => :id} do |t|
      t.integer :user_id
      t.datetime :date_time
      t.string :file_name

      t.timestamps
    end
  end

  
  def down 
      drop_table :photos
  end

end
