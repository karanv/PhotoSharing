class Photo < ActiveRecord::Base
  attr_accessible :date_time, :file_name, :id, :user_id

  belongs_to :user
  has_many :comments 
  has_many :tags
  has_many :users, :through => :tags
  
  @@allPhotos = Photo.all
  
  def self.findPics(word) 
  @@matchingPics = Array.new
  if(word == nil)
	return
  end
  
  @@allPhotos.each do |photo|
    
    @tags = photo.tags.all
    @comments = photo.comments.all
    
      @tags.each do |tag|
        if(tag.user.first_name.downcase.include?(word.to_str().downcase))
          @@matchingPics << photo
        end
      
        if(tag.user.last_name.downcase.include?(word.to_str().downcase))
          @@matchingPics << photo
        end
      end
    
      @comments.each do |comment|
        if(comment.comment.downcase.include?(word.to_str().downcase))
            @@matchingPics << photo
        end
      end
   end
   @@matchingPics = @@matchingPics.uniq
   
   puts "hope this works"
   puts @@matchingPics
    return @@matchingPics
  end
end
