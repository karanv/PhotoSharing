class CreateTags < ActiveRecord::Migration
   def up
      create_table :tags do |t|
        t.column  :id, :int
        t.column  :photo_id, :int
        t.column  :user_id, :int
        t.column  :tagger_id, :int
        t.column  :x_coord, :int
        t.column  :y_coord, :int 
        t.column  :width, :int 
        t.column  :height, :int
        
        t.timestamps
      end
    end

    def down
      drop_table :tags
    end
  end
