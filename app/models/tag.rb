class Tag < ActiveRecord::Base
 attr_accessible :photo_id, :user_id, :tagger_id, :x_coord, :y_coord, :width, :height
  belongs_to:user
  belongs_to:photo
end
