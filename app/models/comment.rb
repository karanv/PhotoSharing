class Comment < ActiveRecord::Base
  attr_accessible :comment, :date_time, :id, :photo_id, :user_id
  belongs_to :photo
  belongs_to :user
  
  def validate_comment
      if (comment.size() <= 0) then
        errors.add(:comment, "Comment field cannot be empty !")
      end
    end
  
  validate :validate_comment
end
